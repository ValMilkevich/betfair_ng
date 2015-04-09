module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Betting operations
      #
      module Auth

        #  Declares module for Operations Base classes
        #
        module Base

          #  Declares Base::Operation class
          #
          class Operation < Operations::Base::Operation

            #  Returns an endpoint for the API request
            #
            def endpoint
              @endpoint ||= "#{config.protocol}://#{ config.host(:auth) }#{ self.class.operation.endpoint_prefix }"
            end

            #  Stores body information
            #
            def request( params = {} )
              convert_hash({})
            end

            #  Returns session token
            #
            def token
              @token ||= self.success? ? self.http_data["token"] : nil
            end

            protected
            #  Do a POST request with request set
            #
            def perform_post( params = {} )
              wrapper do
                self.configure_request(:post) do |http, request|
                  request.set_form_data( self.request( params ) )
                end

                with_cache( self.http_request, self.config.cache_expiration ) do
                  self.post!
                end
              end
            end
          end

          #  Declares Base::Response class
          #
          class Response < Operations::Base::Response
            field :error, type: String
          end

          #  Declares Base::Request class
          #
          class Request  < Operations::Base::Request
          end

        end
      end
    end
  end
end