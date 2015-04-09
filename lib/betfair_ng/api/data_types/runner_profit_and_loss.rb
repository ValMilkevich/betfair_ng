module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares RunnerProfitAndLoss
			#
			# == Fields
			#  - selection_id
			#  - if_win
			#  - if_lose
			#  - if_place
			#
			class RunnerProfitAndLoss < Base

				#  The unique identifier for the selection
				# @!attribute [w]
				#
				field :selection_id, type: "BetfairNg::API::DataTypes::SelectionId", required: false

				#  Profit or loss for the market if this selection is the winner.
				# @!attribute [w]
				#
				field :if_win, type: Float, required: false

				#  Profit or loss for the market if this selection is the loser. Only returned for multi-winner odds markets.
				# @!attribute [w]
				#
				field :if_lose, type: Float, required: false

				#  Profit or loss for the market if this selection is placed. Applies to marketType EACH_WAY only.
				# @!attribute [w]
				#
				field :if_place, type: Float, required: false

			end
		end
	end
end
