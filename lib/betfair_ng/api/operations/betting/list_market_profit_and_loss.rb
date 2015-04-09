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

        #  Declares class for Request Handler for List Market Profit And Loss operation
        #
        # Retrieve profit and loss for a given list of markets. The values are calculated using matched bets and optionally settled bets. Only odds (MarketBettingType = ODDS) markets  are implemented, markets of other types are silently ignored.

        # Please note: listMarketCatalogue does not return markets that are CLOSED.
        #
        module ListMarketProfitAndLoss
          class Request < Base::Request
    				field :market_ids, type: "BetfairNg::API::DataTypes::List", of: String, required: true, default: []
            field :include_settled_bets, type: "BetfairNg::API::DataTypes::Boolean"
            field :include_bsp_bets, type: "BetfairNg::API::DataTypes::Boolean"
            field :net_of_commission, type: "BetfairNg::API::DataTypes::Boolean"
          end

          #  Declares class for Response Handler for List Market Profit And Loss operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::MarketProfitAndLoss
          end

          #  Declares class for Operation Configuration for List Market Profit And Loss operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listMarketProfitAndLoss"
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