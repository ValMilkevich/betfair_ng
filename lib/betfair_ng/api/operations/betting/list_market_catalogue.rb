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

        #  Declares class for Request Handler for List Market Catalogues operation
        #
        # Returns a list of information about published (ACTIVE/SUSPENDED) markets that does not change (or changes very rarely). You use listMarketCatalogue to retrieve the name of the market, the names of selections and other information about markets.  Market Data Request Limitsapply to requests made to listMarketCatalogue.

        # Please note: listMarketCatalogue does not return markets that are CLOSED.
        #
        module ListMarketCatalogue
          class Request < Base::Request
    				field :filter, type: "BetfairNg::API::DataTypes::MarketFilter", required: true, default: {}
    				field :market_projection, type: "BetfairNg::API::DataTypes::Enums::MarketProjection"
    				field :sort, type: "BetfairNg::API::DataTypes::Enums::MarketSort"
    				field :max_results, type: Fixnum, require: true, default: 100
            field :locale, type: String
          end

          #  Declares class for Response Handler for List Market Catalogues operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::MarketBook
          end

          #  Declares class for Operation Configuration for List List Market Catalogues operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listMarketCatalogue"
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