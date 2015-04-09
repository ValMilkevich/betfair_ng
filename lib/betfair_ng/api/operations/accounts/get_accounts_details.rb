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

        # Returns the details relating your account, including your discount rate and Betfair point balance.
        #
        module GetAccountDetails
          #  Declares class for Request Handler for Cancel Order operation
          #
          class Request < Base::Request
          end

          #  Declares class for Response Handler for Cancel Order operation
          #
          class Response < Base::Response
            field :result, type: "BetfairNg::API::DataTypes::AccountDetailsResponse"
          end

          #  Declares class for Operation Configuration for Cancel Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "AccountAPING/v1.0/getAccountDetails"
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