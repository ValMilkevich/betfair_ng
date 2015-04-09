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

        #  Declares class for List Countries operation
        #
        # Returns a list of Countries associated with the markets selected by the MarketFilter.
        #
        module ListCountries

          #  Declares class for Request Handler for List Countries operation
          #
          class Request < Base::Request
    				field :filter, type: "BetfairNg::API::DataTypes::MarketFilter", required: true, default: {}
    				field :locale, type: String, required: false
          end

          #  Declares class for Response Handler for List Countries operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::CountryCodeResult
          end

          #  Declares class for Operation Configuration for List Countries operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listCountries"
              operation.endpoint_prefix = "/exchange/betting/json-rpc/v1"
              operation.http_method = :post
              operation.responder = Response
              operation.requester = Request
            end

            #  Provides parameters for the request
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