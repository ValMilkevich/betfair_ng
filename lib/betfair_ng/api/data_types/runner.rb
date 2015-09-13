module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares Runner
			#
			# == Fields
			#  - selection_id
			#  - handicap
			#  - status
			#  - adjustment_factor
			#  - last_price_traded
			#  - total_matched
			#  - removal_date
			#  - sp
			#  - ex
			#  - orders
			#  - matches
			#
			class Runner < Base

				#  The unique id of the runner (selection)
				# @!attribute [w]
				#
				field :selection_id, type: Fixnum, required: true

				#  The handicap.  Enter the specific handicap value (returned by RUNNER in listMaketBook) if the market is an Asian handicap market.
				# @!attribute [w]
				#
				field :handicap, type: Float, required: true

				#  The status of the selection (i.e., ACTIVE, REMOVED, WINNER, LOSER, HIDDEN) Runner status information is available for 90 days following market settlement.
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::RunnerStatus", required: true

				#  The adjustment factor applied if the selection is removed
				# @!attribute [w]
				#
				field :adjustment_factor, type: Float, required: true

				#  The price of the most recent bet matched on this selection
				# @!attribute [w]
				#
				field :last_price_traded, type: Float, required: false

				#  The total amount matched on this runner
				# @!attribute [w]
				#
				field :total_matched, type: Float, required: false

				#  If date and time the runner was removed
				# @!attribute [w]
				#
				field :removal_date, type: Time, required: false

				#  The BSP related prices for this runner
				# @!attribute [w]
				#
				field :sp, type: "BetfairNg::API::DataTypes::StartingPrices", required: false

				#  The Exchange prices available for this runner
				# @!attribute [w]
				#
				field :ex, type: "BetfairNg::API::DataTypes::ExchangePrices", required: false

				#  List of orders in the market
				# @!attribute [w]
				#
				field :orders, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::Order", required: false

				#  List of matches (i.e, orders that have been fully or partially executed)
				# @!attribute [w]
				#
				field :matches, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::Match", required: false

			end
		end
	end
end
