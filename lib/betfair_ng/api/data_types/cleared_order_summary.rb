module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ClearedOrderSummary
			#
			# == Fields
			#  - event_type_id
			#  - event_id
			#  - market_id
			#  - selection_id
			#  - handicap
			#  - bet_id
			#  - placed_date
			#  - persistence_type
			#  - order_type
			#  - side
			#  - item_description
			#  - price_requested
			#  - settled_date
			#  - bet_count
			#  - commission
			#  - price_matched
			#  - price_reduced
			#  - size_settled
			#  - profit
			#  - size_cancelled
			#
			class ClearedOrderSummary < Base

				#  The id of the event type bet on. Available at EVENT_TYPE groupBy level or lower.
				# @!attribute [w]
				#
				field :event_type_id, type: "BetfairNg::API::DataTypes::EventTypeId", required: false

				#  The id of the event bet on. Available at EVENT groupBy level or lower.
				# @!attribute [w]
				#
				field :event_id, type: "BetfairNg::API::DataTypes::EventId", required: false

				#  The id of the market bet on. Available at MARKET groupBy level or lower.
				# @!attribute [w]
				#
				field :market_id, type: "BetfairNg::API::DataTypes::MarketId", required: false

				#  The id of the selection bet on. Available at RUNNER groupBy level or lower.
				# @!attribute [w]
				#
				field :selection_id, type: "BetfairNg::API::DataTypes::SelectionId", required: false

				#  The id of the market bet on. Available at MARKET groupBy level or lower.
				# @!attribute [w]
				#
				field :handicap, type: "BetfairNg::API::DataTypes::Handicap", required: false

				#  The id of the bet. Available at BET groupBy level.
				# @!attribute [w]
				#
				field :bet_id, type: "BetfairNg::API::DataTypes::BetId", required: false

				#  The date the bet order was placed by the customer. Only available at BET groupBy level.
				# @!attribute [w]
				#
				field :placed_date, type: Time, required: false

				#  The turn in play persistence state of the order at bet placement time. This field will be empty or omitted on true SP bets. Only available at BET groupBy level.
				# @!attribute [w]
				#
				field :persistence_type, type: "BetfairNg::API::DataTypes::Enums::PersistenceType", required: false

				#  The type of bet (e.g standard limited-liability Exchange bet (LIMIT), a standard BSP bet (MARKET_ON_CLOSE), or a minimum-accepted-price BSP bet (LIMIT_ON_CLOSE)). If the bet has a OrderType of MARKET_ON_CLOSE and a persistenceType of MARKET_ON_CLOSE then it is a bet which has transitioned from LIMIT to MARKET_ON_CLOSE. Only available at BET groupBy level.
				# @!attribute [w]
				#
				field :order_type, type: "BetfairNg::API::DataTypes::Enums::OrderType", required: false

				#  Whether the bet was a back or lay bet. Available at SIDE groupBy level or lower.
				# @!attribute [w]
				#
				field :side, type: "BetfairNg::API::DataTypes::Enums::Side", required: false

				#  A container for all the ancillary data and localised text valid for this Item
				# @!attribute [w]
				#
				field :item_description, type: "ItemDescription", required: false

				#  The average requested price across all settled bet orders under this Item. Available at SIDE groupBy level or lower.
				# @!attribute [w]
				#
				field :price_requested, type: "BetfairNg::API::DataTypes::Price", required: false

				#  The date and time the bet order was settled by Betfair. Available at SIDE groupBy level or lower.
				# @!attribute [w]
				#
				field :settled_date, type: Time, required: false

				#  The number of actual bets within this grouping (will be 1 for BET groupBy)
				# @!attribute [w]
				#
				field :bet_count, type: Fixnum, required: false

				#  The cumulative amount of commission paid by the customer across all bets under this Item, in the account currency. Available at EXCHANGE, EVENT_TYPE, EVENT and MARKET level groupings only.
				# @!attribute [w]
				#
				field :commission, type: "BetfairNg::API::DataTypes::Size", required: false

				#  The average matched price across all settled bets or bet fragments under this Item. Available at SIDE groupBy level or lower.
				# @!attribute [w]
				#
				field :price_matched, type: "BetfairNg::API::DataTypes::Price", required: false

				#  If true, then the matched price was affected by a reduction factor due to of a runner removal from this Horse Racing market.
				# @!attribute [w]
				#
				field :price_reduced, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  The cumulative bet size that was settled as matched or voided under this Item, in the account currency. Available at SIDE groupBy level or lower.
				# @!attribute [w]
				#
				field :size_settled, type: "BetfairNg::API::DataTypes::Size", required: false

				#  The profit or loss (negative profit) gained on this line, in the account currency
				# @!attribute [w]
				#
				field :profit, type: "BetfairNg::API::DataTypes::Size", required: false

				#  The amount of the bet that was available to be matched, before cancellation or lapsing, in the account currency
				# @!attribute [w]
				#
				field :size_cancelled, type: "BetfairNg::API::DataTypes::Size", required: false

			end
		end
	end
end
