module BetfairNg

  #  Declares the module for API interactions
  #
  module API
    module Concerns

      #  Declares shared module for all API HTTP methods
      #
      module HTTP
        extend ActiveSupport::Concern
        include Cache

        #  Holds reference for request, response over-the-network requests
        #
        attr_accessor :http_connection, :http_request, :http_response, :http_code, :http_data

        #  Holds reference to endpoint of the operation
        #
        attr_accessor :endpoint

        #  SSL Key to use
        #
        def ssl_key
          self.config.ssl_key
        end

        #  SSL Certificate to use
        #
        def ssl_cert
          self.config.ssl_cert
        end

        #  Returns endpoint to be called by the operation
        #
        def endpoint
          raise NotImplementedError
        end

        #  Returns URI endpoint to be called by the operation
        #
        def uri_endpoint
          URI( self.endpoint )
        end

        # Returns true if we are working over SSL
        #
        def ssl?
          uri_endpoint.scheme == 'https'
        end

        #  Stores headers information
        #
        def http_headers
          {
            "X-Application" => self.config.application_key,
            "Content-Type" => "application/x-www-form-urlencoded",
            "Accept" => "application/json"
          }
        end

        #  Stores body information
        #
        def request( params = {} )
          params
        end

        #  Configures a request
        #
        def configure_request(verb, &block)
          if verb == :get
            self.http_request = Net::HTTP::Get.new(uri_endpoint.request_uri)
          else
            self.http_request = Net::HTTP::Post.new(uri_endpoint.request_uri)
          end

          self.http_headers.each do |key, value|
            self.http_request.add_field key, value
          end

          block.call(self.https, self.http_request)
        end
        #  Perform a GET request
        #
        def get!
          self.https.request self.http_request # Net::HTTPResponse object
        end

        #  Perform a POST request
        #
        def post!
          self.https.request self.http_request # Net::HTTPResponse object
        end

        # Returns stored object of Net::HTTP connection
        #
        def https( force = false )
          return self.http_connection if self.http_connection && !force

          self.http_connection = Net::HTTP.new( self.uri_endpoint.host, self.uri_endpoint.port )
          self.http_connection.use_ssl = self.ssl?
          self.http_connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
          self.http_connection.cert = self.ssl_cert
          self.http_connection.key = self.ssl_key

          self.http_connection
        end

      end

    end
  end
end