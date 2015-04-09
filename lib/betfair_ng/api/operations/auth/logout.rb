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

        #  Declares class for Logout operation
        #
        module Logout

          class Response < Base::Response
            field :result, type: OpenStruct
          end

          class Request < Base::Request
          end

          class Operation < Base::Operation
            configure do |operation|
              operation.endpoint_prefix = "/api/logout"
              operation.http_method = :get
              operation.responder = Response
            end

            #  Returns if operation succeded
            #
            def success?
              super && self.http_data["status"] == "SUCCESS"
            end
          end
        end
      end
    end
  end
end