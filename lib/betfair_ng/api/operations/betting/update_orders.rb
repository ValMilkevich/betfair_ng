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

        # Update non-exposure changing fields
        #
        module UpdateOrders
          #  Declares class for Request Handler for Update Order operation
          #
          class Request < Base::Request

            # The market id these orders are to be placed on
    				field :market_id, type: String, required: true

            # The number of update instructions.  The limit of update instructions per request is 60
    				field :instructions, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::PlaceInstruction, required: true

            # Optional parameter allowing the client to pass a unique string (up to 32 chars) that is used to de-dupe mistaken re-submissions.
            field :customer_ref, type: String
          end

          #  Declares class for Response Handler for Update Order operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::UpdateExecutionReport
          end

          #  Declares class for Operation Configuration for Update Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/updateOrders"
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