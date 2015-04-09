module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Betting operations
      #
      module Accounts

        # Get all application keys owned by the given developer/vendor.
        #
        module ListCurrencyRates

          #  Declares class for Request Handler for Cancel Order operation
          #
          class Request < Base::Request
            #  The currency from which the rates are computed. Please note: GBP is currently the only based currency support
            field :from_currency, type: String
          end

          #  Declares class for Response Handler for Cancel Order operation
          #
          class Response < Base::Response
            field :result, type: "BetfairNg::API::DataTypes::List", of: "BetfairNg::API::DataTypes::CurrencyRate"
          end

          #  Declares class for Operation Configuration for Cancel Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "AccountAPING/v1.0/listCurrencyRates"
              operation.endpoint_prefix = "/exchange/account/json-rpc/v1"
              operation.http_method = :post
              operation.responder = Response
              operation.requester = Request
            end

            #  Provides parameters for the request
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