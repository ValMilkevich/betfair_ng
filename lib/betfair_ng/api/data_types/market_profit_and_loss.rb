module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketProfitAndLoss
			#
			# == Fields
			#  - market_id
			#  - commission_applied
			#  - profit_and_losses
			#
			class MarketProfitAndLoss < Base

				#  The unique identifier for the market
				# @!attribute [w]
				#
				field :market_id, type: String, required: false

				#  The commission rate applied to P&L values. Only returned if netOfCommision option is requested
				# @!attribute [w]
				#
				field :commission_applied, type: Float, required: false

				#  Calculated profit and loss data.
				# @!attribute [w]
				#
				field :profit_and_losses, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::RunnerProfitAndLoss", required: false

			end
		end
	end
end
