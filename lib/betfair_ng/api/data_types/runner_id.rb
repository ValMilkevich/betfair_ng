module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares RunnerId
			#
			# == Fields
			#  - market_id
			#  - selection_id
			#  - handicap
			#
			class RunnerId < Base

				#  The id of the market bet on
				# @!attribute [w]
				#
				field :market_id, type: "BetfairNg::API::DataTypes::MarketId", required: true

				#  The id of the selection bet on
				# @!attribute [w]
				#
				field :selection_id, type: "BetfairNg::API::DataTypes::SelectionId", required: true

				#  The handicap associated with the runner in case of asian handicap markets, null otherwise.
				# @!attribute [w]
				#
				field :handicap, type: "BetfairNg::API::DataTypes::Handicap", required: false

			end
		end
	end
end
