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

        #  Declares class for KeepAlive operation
        #
        # You can use Keep Alive to extend the session timeout period.
        # The minimum session time is currently 20 minutes (Italian Exchange).
        # On the international (.com) Exchange the current session time is 12 hours.
        # Therefore, you should request Keep Alive within this time to prevent session expiry.
        # If you don't call Keep Alive within the specified timeout period, the session will expire.
        # Session times aren't determined or extended based on API activity.
        #
        module KeepAlive
          class Response < Base::Response
            field :result, type: OpenStruct
          end

          class Request < Base::Request
          end

          class Operation < Base::Operation

            configure do |operation|
              operation.endpoint_prefix = "/api/keepAlive"
              operation.http_method = :get
              operation.responder = Response
              operation.requester = Request
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