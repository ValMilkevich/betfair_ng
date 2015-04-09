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

        # Get account statement
        #
        module GetAccountStatement
          #  Declares class for Request Handler for Cancel Order operation
          #
          class Request < Base::Request
            #  The language to be used where applicable. If not specified, the customer account default is returned.
            field :locale, type: String

            #  Specifies the first record that will be returned. Records start at index zero. If not specified then it will default to 0.
            field :from_record, type: Fixnum

            #  Specifies the maximum number of records to be returned. Note that there is a page size limit of 100.
            field :record_count, type: Fixnum

            #  Return items with an itemDate within this date range. Both from and to date times are inclusive. If from is not specified then the oldest available items will be in range. If to is not specified then the latest items will be in range. nb. This itemDataRange is currently only applied when includeItem is set to ALL or not specified, else items are NOT bound by itemDate.
            field :item_date_range, type: "BetfairNg::API::DataTypes::TimeRange"

            #  Which items to include, if not specified then defaults to ALL.
            field :include_item, type: "BetfairNg::API::DataTypes::Enums::IncludeItem"

            #  Which wallet to return statementItems for. If unspecified then the UK wallet will be selected
            field :wallet, type: "BetfairNg::API::DataTypes::Enums::Wallet"

          end

          #  Declares class for Response Handler for Cancel Order operation
          #
          class Response < Base::Response
            field :result, type: "BetfairNg::API::DataTypes::AccountStatementReport"
          end

          #  Declares class for Operation Configuration for Cancel Order operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "AccountAPING/v1.0/getAccountStatement"
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