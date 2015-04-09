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

        # Place new orders into market. This operation is atomic in that all orders will be placed or none will be placed. Please note that additional bet sizing rules apply to bets placed into the Italian Exchange.
        #
        module PlaceOrders
          #  Declares class for Request Handler for Place Order operation
          #
          class Request < Base::Request

            # The market id these orders are to be placed on
    				field :market_id, type: String, required: true

            # The number of place instructions.  The limit of place instructions per request is 200 for the UK/AUS Exchange and 50 for the Italian Exchange.
    				field :instructions, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::PlaceInstruction, required: true

            # Optional parameter allowing the client to pass a unique string (up to 32 chars) that is used to de-dupe mistaken re-submissions.   CustomerRef can contain: upper/lower chars, digits, chars : - . _ + * : ; ~ only. Please note: There is a time window associated with the de-duplication of duplicate submissions which is 60 seconds.
            field :customer_ref, type: String
          end

          #  Declares class for Response Handler for Place Order operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::PlaceExecutionReport
          end

          #  Declares class for Operation Configuration for Place Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/placeOrders"
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