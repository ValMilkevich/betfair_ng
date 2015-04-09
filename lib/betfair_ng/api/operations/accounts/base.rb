module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Accounts operations
      #
      module Accounts

        #  Declares a Base class for all Accounts operations
        #
        module Base

          #  Declares Base::Operation class
          #
          class Operation < Operations::Betting::Base::Operation

            #  Returns an endpoint for the API request
            #
            def endpoint
              @endpoint ||= "#{config.protocol}://#{ config.host(:accounts) }#{ self.class.operation.endpoint_prefix }"
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
