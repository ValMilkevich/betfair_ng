module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares StartingPrices
			#
			# == Fields
			#  - near_price
			#  - far_price
			#  - back_stake_taken
			#  - lay_liability_taken
			#  - actual_sp
			#
			class StartingPrices < Base

				#  What the starting price would be if the market was reconciled now taking into account the SP bets as well as unmatched exchange bets on the same selection in the exchange. - Please note: Type Double may contain numbers, INF, -INF, and NaN.
				# @!attribute [w]
				#
				field :near_price, type: Float, required: false

				#  What the starting price would be if the market was reconciled now taking into account only the currently place SP bets. The Far Price is not as complicated but not as accurate and only accounts for money on the exchange at SP. - Please note: Type Double may contain numbers, INF, -INF, and NaN.
				# @!attribute [w]
				#
				field :far_price, type: Float, required: false

				#  The back bets matched at the actual Betfair Starting Price
				# @!attribute [w]
				#
				field :back_stake_taken, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::PriceSize", required: false

				#  The lay amount matched at the actual Betfair Starting Price
				# @!attribute [w]
				#
				field :lay_liability_taken, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::PriceSize", required: false

				#  The final BSP price for this runner. Only available for a BSP market that has been reconciled.
				# @!attribute [w]
				#
				field :actual_sp, type: Float, required: false

			end
		end
	end
end
