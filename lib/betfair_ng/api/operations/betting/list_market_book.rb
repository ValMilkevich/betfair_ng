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

        #  Declares class for Request Handler for List Market Book operation
        #
        # Returns a list of Events (i.e, Reading vs. Man United) associated with the markets selected by the MarketFilter.
        #
        module ListMarketBook
          class Request < Base::Request
    				field :market_ids, type: "BetfairNg::API::DataTypes::List", of: String, required: true, default: []
    				field :price_projection, type: "BetfairNg::API::DataTypes::PriceProjection"
    				field :order_projection, type: "BetfairNg::API::DataTypes::OrderProjection"
    				field :match_projection, type: "BetfairNg::API::DataTypes::MatchProjection"
            field :currency_code, type: String
            field :locale, type: String
          end

          #  Declares class for Response Handler for List Market Book operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::MarketBook
          end

          #  Declares class for Operation Configuration for List Market Book operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listMarketBook"
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