require 'active_support/concern'

module BetfairNg
  #  Declares the module for Configuration logic
  #
  module Configuration
    extend ActiveSupport::Concern

    module ClassMethods
      attr_accessor :config

      #  Sets the class variable config from either .yml file or a block
      #
      def configure( path = nil )
        @config = Config.new( load_yml(path)[env] )

        yield(@config) if block_given?

        @config
      end

      #  Returns or initializes config
      #
      def config
        @config || configure(Constants::DEFAULT_YAML_CONFIG)
      end

      #  Loads file from the config file
      #
      def load_yml( path )
        begin
          config = YAML.load(
            ERB.new(
              File.read(
                File.join(root_path, path)
              )
            ).result
          ) if path
        # rescue Errno::ENOENT
        #   log(:warning, "YAML configuration file couldn't be found. Using defaults."); return
        # rescue Psych::SyntaxError
        #   log(:warning, "YAML configuration file contains invalid syntax. Using defaults."); return
        end  || {}
      end

      #  Represents rails environment
      #
      def env
        return ENV['BETFAIR_NG_ENV'] if ENV['BETFAIR_NG_ENV']
        return ::Rails.env if defined?(Rails) && Rails.try(:env)
        return ENV['RAILS_ENV'] if ENV['RAILS_ENV']
        return Constants::DEFAULT_ENVIRONMENT
      rescue
        return Constants::DEFAULT_ENVIRONMENT
      end

      #  Returns root path of the current setup
      #
      def root_path
        @root_path = Rails.try(:root) if defined?(Rails)
        @root_path ||= File.expand_path('..', __FILE__)
      end
    end

    #  Declares a module containing all system constants
    #
    module Constants
      extend ActiveSupport::Concern

      HOSTS = {
        au: {
          auth: 'identitysso.betfair.com', betting: 'api-au.betfair.com', accounts: 'api-au.betfair.com', heartbeat: 'api-au.betfair.com'
        },
        com: {
          auth: 'identitysso.betfair.com', betting: 'api.betfair.com', accounts: 'api.betfair.com', heartbeat: 'api.betfair.com'
        },
        it: {
          auth: 'identitysso.betfair.it', betting: 'api.betfair.com', accounts: 'api.betfair.com', heartbeat: 'api-au.betfair.com'
        }
      }

      DEFAULT_CACHE_EXPIRATION = 60
      DEFAULT_COUNTRY = :com
      DEFAULT_LOCALE = :en
      DEFAULT_PROTOCOL = :https
      DEFAULT_YAML_CONFIG = "config/betfair_ng.yml"
      DEFAULT_ENVIRONMENT = "development"
    end

    #  Declares a class to store config data
    #
    class Config < OpenStruct
      include Constants

      def initialize( params = {} )
        super( self.class.default.merge(params.to_h) )

        validates_country!(self.country)
      end

      #  Returns default configuration
      #
      def self.default
        {
          cache: :simple,
          cache_expiration: DEFAULT_CACHE_EXPIRATION,
          locale: DEFAULT_LOCALE,      # en | en_GB | bg | da | de | el | es | it | pt | ru | sv
          country: DEFAULT_COUNTRY,
          protocol: DEFAULT_PROTOCOL,
          keys: {},
          application_key: nil,
          username: nil,
          password: nil,
          token: nil,
          ssl_key_path: nil,
          ssl_cert_path: nil
        }
      end

      #  Sets the current operations cache storage
      #
      def set_cache_storage( type, new_cache_storage )
        @cache_storages ||= {}

        self.cache = type
        @cache_storages[type] = new_cache_storage
      end

      #  Returns reference to the cache storage
      #
      def cache_storage
        @cache_storages ||= {}

        @cache_storages[self.cache] ||= case self.cache
        when :simple
          BetfairNg::Cache::Simple.new({})
        when :none
          nil
        end
      end

      #  Returns SSL key object
      #
      def ssl_key
        self.keys[self.ssl_key_path] ||= OpenSSL::PKey::RSA.new read_file(self.ssl_key_path)
      end

      #  Returns SSL certificate object
      #
      def ssl_cert
        self.keys[self.ssl_cert_path] ||= OpenSSL::X509::Certificate.new read_file(self.ssl_cert_path)
      end

      #  Returns the host of the request
      #
      def host(operation_type)
        HOSTS[self.country.to_sym][operation_type.to_sym]
      end

      #  Raises exception if country does not have API endpoints
      #
      def validates_country!(val)
        if !HOSTS.keys.include?(val.to_s.downcase.to_sym)
          raise "Country #{val} is not supported. Only (#{BetfairNg::Configuration::Config::HOSTS.keys.join(',')}) are supported."
        end
      end

      private

      def read_file(path)
        File.read File.join(BetfairNg.root_path, path)
      rescue
        ""
      end
    end
  end
end