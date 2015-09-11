module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for Operations Base classes
      #
      module Base

        #  Declares Base::Operation class
        #
        class Operation
          include Concerns::Configurable
          include Concerns::Cache
          include Concerns::HTTP
          include Concerns::Serialization

          #  Holds reference to BetfairNg config
          #
          attr_accessor :config, :response

          #  Create the new object of config for each operation
          #  Initializes reference to BetfairNg config
          #
          def initialize( params = {})
            self.config = Configuration::Config.new(
              BetfairNg.config.to_h.merge(
                params[:config].to_h
              )
            )
          end

          #  Attempts to perform an operation
          #
          def perform( params = {} )
            if self.class.operation.http_method == :post
              perform_post(params)
            else
              perform_get(params)
            end

            data
          end

          # Represents response method
          #
          def response
            if self.http_data.present?
              self.class.operation.responder.new( self.http_data.to_h )
            else
              nil
            end
          end

          # Represents data method
          #
          def data
            self.response.try(:result) || []
          end

          #  Returns true if the operation succedeed
          #
          def success?
            !!self.http_data && self.http_code == '200' && self.http_data.error.blank?
          end

          #  Stores headers information
          #
          def http_headers
            super.tap{ |headers|
              headers["X-Authentication"] = self.config.token if self.config.token
            }
          end

          #  Defines cache storage for the operation
          #
          def cache_storage
            self.config.cache_storage
          end

          protected

          #  Do a POST request with request set
          #
          def perform_post( params = {} )
            wrapper do
              configure_request(:post) do |http, http_request|
                http_request.body = request( params ).to_json
              end

              with_cache( self.http_request, self.config.cache_expiration ) do
                self.post!
              end
            end
          end

          #  Do a GET request with request set
          #
          def perform_get( params = {} )
            wrapper do
              configure_request(:get) do |http, request|
                request.set_form_data( self.request( params ) )
              end

              with_cache( self.http_request, self.config.cache_expiration ) do
                self.get!
              end
            end
          end

          #  Performs utility methods to store the result of the operation
          #
          def wrapper(&block)
            begin
              self.http_response = block.call(self)
              self.http_data = OpenStruct.new( MultiJson.load(self.http_response.body) )
              self.http_code = self.http_response.code
            rescue => e
              self.http_data = OpenStruct.new( error: e )
              self.http_code = nil
              raise e
            end
          end
        end


        #  Declares Base::Response class
        #
        class Response < OpenStruct
          include BetfairNg::API::Concerns::Field
          include BetfairNg::API::Concerns::Serialization

          field :error, type: "BetfairNg::API::DataTypes::Exception"
        end

        #  Declares Base::Request class
        #
        class Request < OpenStruct
          include BetfairNg::API::Concerns::Field
          include BetfairNg::API::Concerns::Serialization
        end

      end
    end
  end
end