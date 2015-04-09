module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares PlaceInstruction
			#
			# == Fields
			#  - order_type
			#  - selection_id
			#  - handicap
			#  - side
			#  - limit_order
			#  - limit_on_close_order
			#  - market_on_close_order
			#
			class PlaceInstruction < Base

				#   
				# @!attribute [w]
				#
				field :order_type, type: "BetfairNg::API::DataTypes::Enums::OrderType", required: true

				#  The selection_id.
				# @!attribute [w]
				#
				field :selection_id, type: Fixnum, required: true

				#  The handicap associated with the runner in case of Asian handicap markets, null otherwise.
				# @!attribute [w]
				#
				field :handicap, type: Float, required: false

				#  Back or Lay
				# @!attribute [w]
				#
				field :side, type: "BetfairNg::API::DataTypes::Enums::Side", required: true

				#  A simple exchange bet for immediate execution
				# @!attribute [w]
				#
				field :limit_order, type: "BetfairNg::API::DataTypes::LimitOrder", required: false

				#  Bets are matched if, and only if, the returned starting price is better than a specified price. In the case of back bets, LOC bets are matched if the calculated starting price is greater than the specified price. In the case of lay bets, LOC bets are matched if the starting price is less than the specified price. If the specified limit is equal to the starting price, then it may be matched, partially matched, or may not be matched at all, depending on how much is needed to balance all bets against each other (MOC, LOC and normal exchange bets)
				# @!attribute [w]
				#
				field :limit_on_close_order, type: "BetfairNg::API::DataTypes::LimitOnCloseOrder", required: false

				#  Bets remain unmatched until the market is reconciled. They are matched and settled at a price that is representative of the market at the point the market is turned in-play. The market is reconciled to find a starting price and MOC bets are settled at whatever starting price is returned. MOC bets are always matched and settled, unless a starting price is not available for the selection. Market on Close bets can only be placed before the starting price is determined
				# @!attribute [w]
				#
				field :market_on_close_order, type: "BetfairNg::API::DataTypes::MarketOnCloseOrder", required: false

			end
		end
	end
end
