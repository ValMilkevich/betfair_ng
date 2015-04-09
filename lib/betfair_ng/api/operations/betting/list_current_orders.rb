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

        #  Declares class for List Current Orders operation
        #
        # Returns a list of your current orders. Optionally you can filter and sort your current orders using the various parameters, setting none of the parameters will return all of your current orders up to a maximum of 1000 bets, ordered BY_BET and sorted EARLIEST_TO_LATEST. To retrieve more than 1000 orders, you need to make use of the fromRecord and recordCount parameters.
        #
        module ListCurrentOrders

          #  Declares class for Request Handler for List Current Orders operation
          #
          class Request < Base::Request
    				field :bet_ids, type: "BetfairNg::API::DataTypes::List", of: String, default: []
    				field :market_ids, type: "BetfairNg::API::DataTypes::List", of: String, default: []
    				field :order_projection, type: "BetfairNg::API::DataTypes::Enums::OrderProjection"
    				field :date_range, type: "BetfairNg::API::DataTypes::TimeRange"
    				field :order_by, type: "BetfairNg::API::DataTypes::Enums::OrderBy"
    				field :order_by, type: "BetfairNg::API::DataTypes::Enums::SortDir"
          end

          #  Declares class for Response Handler for List Current Orders operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::CurrentOrderSummaryReport
          end

          #  Declares class for Operation Configuration for List Current Orders operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listCurrentOrders"
              operation.endpoint_prefix = "/exchange/betting/json-rpc/v1"
              operation.http_method = :post
              operation.responder = Response
              operation.requester = Request
            end

            #  Providers parameters for the request
            #
            def request_params( params = {} )
              params
            end
          end
        end
      end
    end
  end
end