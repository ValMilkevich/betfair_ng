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

        #  Declares module for ListClearedOrders operation
        #
        # Returns a list of settled bets based on the bet status, ordered by settled date. To retrieve more than 1000 records, you need to make use of the fromRecord and recordCount parameters. By default the service will return all available data for the last 90 days (see Best Practice note below).  The fields available at each roll-up are available here
        #
        module ListClearedOrders

          #  Declares class for Request Handler for ListClearedOrders operation
          #
          class Request < Base::Request
    				field :bet_status, type: "BetfairNg::API::DataTypes::Enums::BetStatus", required: true, default: true
    				field :event_type_ids, type: "BetfairNg::API::DataTypes::Set", of: "BetfairNg::API::DataTypes::EventTypeId", default: []
            field :event_ids, type: "BetfairNg::API::DataTypes::Set", of: "BetfairNg::API::DataTypes::EventId", default: []
            field :market_ids, type: "BetfairNg::API::DataTypes::Set", of: "BetfairNg::API::DataTypes::MarketId", default: []
            field :runner_ids, type: "BetfairNg::API::DataTypes::Set", of: "BetfairNg::API::DataTypes::RunnerId", default: []
            field :bet_ids, type: "BetfairNg::API::DataTypes::Set", of: "BetfairNg::API::DataTypes::BetId", default: []
    				field :side, type: "BetfairNg::API::DataTypes::Enums::Side"
    				field :settled_date_range, type: "BetfairNg::API::DataTypes::TimeRange"
            field :group_by, type: "BetfairNg::API::DataTypes::Enums::GroupBy"
            field :include_item_description, type: "BetfairNg::API::DataTypes::Boolean"
            field :locale, type: String
            field :from_record, type: Fixnum
            field :record_count, type: Fixnum
          end

          #  Declares class for Response Handler for ListClearedOrders operation
          #
          class Response < Base::Response
            field :result, type: BetfairNg::API::DataTypes::ClearedOrderSummaryReport
          end

          #  Declares class for Operation configuration for ListClearedOrders operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.name = "SportsAPING/v1.0/listClearedOrders"
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