module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Accounts operations
      #
      module Heartbeat

        #  Declares a Base class for all Accounts operations
        #
        module Base

          #  Declares Base::Operation class
          #
          class Operation < Operations::Base::Operation

            #  Returns an endpoint for the API request
            #
            def endpoint
              @endpoint ||= "#{config.protocol}://#{ config.host(:heartbeat) }#{ self.class.operation.endpoint_prefix }"
            end

            #  Request body
            #
            def request(params = {})
              convert_hash(
                {
                  method: self.class.operation.name,
                  params: self.class.operation.requester.new(request_params(params)).data
                }
              )
            end

          end

          #  Declares Base::Response class
          #
          class Response < Operations::Base::Response
          end

          #  Declares Base::Request class
          #
          class Request < Operations::Base::Request
          end
        end
      end
    end
  end
end
