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

        # This operation is logically a bulk cancel followed by a bulk place. The cancel is completed first then the new orders are placed. The new orders will be placed atomically in that they will all be placed or none will be placed. In the case where the new orders cannot be placed the cancellations will not be rolled back. See ReplaceInstruction.
        #
        module ReplaceOrders
          #  Declares class for Request Handler for Replace Order operation
          #
          class Request < Base::Request

            # The market id these orders are to be placed on
    				field :market_id, type: String, required: true

            # The number of replace instructions.  The limit of replace instructions per request is 60.
    				field :instructions, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::ReplaceInstruction, required: true

            # Optional parameter allowing the client to pass a unique string (up to 32 chars) that is used to de-dupe mistaken re-submissions.
            field :customer_ref, type: String
          end

          #  Declares class for Response Handler for Replace Order operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::ReplaceExecutionReport
          end

          #  Declares class for Operation Configuration for Replace Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/replaceOrders"
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