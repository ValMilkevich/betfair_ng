module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Betting operations
      #
      module Betting

        # Cancel all bets OR cancel all bets on a market OR fully or partially cancel particular orders on a market. Only LIMIT orders can be cancelled or partially cancelled once placed.
        #
        module CancelOrders
          #  Declares class for Request Handler for Cancel Order operation
          #
          class Request < Base::Request

            # If marketId and betId aren't supplied all bets are cancelled
    				field :market_id, type: String, required: true

            # All instructions need to be on the same market. If not supplied all bets on the market (if market id is passed) are fully cancelled.  The limit of cancel instructions per request is 60
    				field :instructions, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::CancelInstruction, required: true

            # Optional parameter allowing the client to pass a unique string (up to 32 chars) that is used to de-dupe mistaken re-submissions.
            field :customer_ref, type: String
          end

          #  Declares class for Response Handler for Cancel Order operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::CancelExecutionReport
          end

          #  Declares class for Operation Configuration for Cancel Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/cancelOrders"
              operation.endpoint_prefix = "/exchange/betting/json-rpc/v1"
              operation.http_method = :post
              operation.responder = Response
              operation.requester = Request
            end

            #  Providers parameters for the request
            #
            def request_params(params = {})
              {
                locale: self.config.locale
              }.merge(params)
            end
          end
        end
      end
    end
  end
end