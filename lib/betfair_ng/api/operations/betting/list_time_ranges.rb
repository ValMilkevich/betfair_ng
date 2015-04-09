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

        #  Declares class for Request Handler for List Time Ranges operation
        #
        # Returns a list of market types (i.e. MATCH_ODDS, NEXT_GOAL) associated with the markets selected by the MarketFilter. The market types are always the same, regardless of locale.
        #
        module ListTimeRanges
          class Request < Base::Request
    				field :filter, type: "BetfairNg::API::DataTypes::MarketFilter", required: true, default: {}
    				field :granularity, type: "BetfairNg::API::DataTypes::Enums::TimeGranularity", required: true, default: true
          end

          #  Declares class for Response Handler for List Time Ranges operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::List, of: BetfairNg::API::DataTypes::TimeRangeResult
          end

          #  Declares class for Operation Configuration for List Time Ranges operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listTimeRanges"
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