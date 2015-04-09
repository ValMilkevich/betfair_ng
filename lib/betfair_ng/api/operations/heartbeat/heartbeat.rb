module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Betting operations
      #
      module Heartbeat

        # Cancel all bets OR cancel all bets on a market OR fully or partially cancel particular orders on a market. Only LIMIT orders can be cancelled or partially cancelled once placed.
        #
        module Heartbeat
          #  Declares class for Request Handler for Cancel Order operation
          #
          class Request < Base::Request
            # Maximum period in seconds that may elapse (without a subsequent heartbeat request), before a cancellation request is automatically submitted on your behalf. The minimum value is 10, the maximum value permitted is 300. Passing 0 will result in your heartbeat being unregistered (or ignored if you have no current heartbeat registered). You will still get an actionPerformed value returned when passing 0, so this may be used to determine if any action was performed since your last heartbeat, without actually registering a new heartbeat. Passing a negative value will result in an error being returned, INVALID_INPUT_DATA. Any errors while registering your heartbeat will result in a error being returned, UNEXPECTED_ERROR. Passing a value that is less than the minimum timeout will result in your heartbeat adopting the minimum timeout. Passing a value that is greater than the maximum timeout will result in your heartbeat adopting the maximum timeout. The minimum and maximum timeouts are subject to change, so your client should utilise the returned actualTimeoutSeconds to set an appropriate frequency for your subsequent heartbeat requests.
            field :preferred_timeout_seconds, type: Fixnum, required: true, default: 300
          end

          #  Declares class for Response Handler for Cancel Order operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::HeartbeatReport
          end

          #  Declares class for Operation Configuration for Cancel Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.endpoint_prefix = "/exchange/heartbeat/json-rpc/v1"
              operation.name = "HeartbeatAPING/v1.0/heartbeat"
              operation.http_method = :post
              operation.responder = Response
              operation.requester = Request
            end

            #  Providers parameters for the request
            #
            def request_params(params = {})
              params
            end

          end
        end
      end
    end
  end
end