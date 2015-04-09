module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketBook
			#
			# == Fields
			#  - market_id
			#  - is_market_data_delayed
			#  - status
			#  - bet_delay
			#  - bsp_reconciled
			#  - complete
			#  - inplay
			#  - number_of_winners
			#  - number_of_runners
			#  - number_of_active_runners
			#  - last_match_time
			#  - total_matched
			#  - total_available
			#  - cross_matching
			#  - runners_voidable
			#  - version
			#  - runners
			#
			class MarketBook < Base

				#  The unique identifier for the market. MarketId's are prefixed with '1.' or '2.' 1. = UK Exchange 2. = AUS Exchange.
				# @!attribute [w]
				#
				field :market_id, type: String, required: true

				#  True if the data returned by listMarketBook will be delayed. The data may be delayed because you are not logged in with a funded account or you are using an Application Key that does not allow up to date data.
				# @!attribute [w]
				#
				field :is_market_data_delayed, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  The status of the market, for example ACTIVE, SUSPENDED, CLOSED (settled), etc.
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::MarketStatus", required: false

				#  The number of seconds an order is held until it is submitted into the market. Orders are usually delayed when the market is in-play
				# @!attribute [w]
				#
				field :bet_delay, type: Fixnum, required: false

				#  True if the market starting price has been reconciled
				# @!attribute [w]
				#
				field :bsp_reconciled, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  If false, runners may be added to the market
				# @!attribute [w]
				#
				field :complete, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  True if the market is currently in play
				# @!attribute [w]
				#
				field :inplay, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  The number of selections that could be settled as winners
				# @!attribute [w]
				#
				field :number_of_winners, type: Fixnum, required: false

				#  The number of runners in the market
				# @!attribute [w]
				#
				field :number_of_runners, type: Fixnum, required: false

				#  The number of runners that are currently active. An active runner is a selection available for betting
				# @!attribute [w]
				#
				field :number_of_active_runners, type: Fixnum, required: false

				#  The most recent time an order was executed
				# @!attribute [w]
				#
				field :last_match_time, type: Date, required: false

				#  The total amount matched
				# @!attribute [w]
				#
				field :total_matched, type: Float, required: false

				#  The total amount of orders that remain unmatched
				# @!attribute [w]
				#
				field :total_available, type: Float, required: false

				#  True if cross matching is enabled for this market.
				# @!attribute [w]
				#
				field :cross_matching, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  True if runners in the market can be voided
				# @!attribute [w]
				#
				field :runners_voidable, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  The version of the market. The version increments whenever the market status changes, for example, turning in-play, or suspended when a goal is scored.
				# @!attribute [w]
				#
				field :version, type: Fixnum, required: false

				#  Information about the runners (selections) in the market.
				# @!attribute [w]
				#
				field :runners, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::Runner", required: false

			end
		end
	end
end
