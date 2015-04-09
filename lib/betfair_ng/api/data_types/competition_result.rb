module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CompetitionResult
			#
			# == Fields
			#  - competition
			#  - market_count
			#  - competition_region
			#
			class CompetitionResult < Base

				#  Competition
				# @!attribute [w]
				#
				field :competition, type: "BetfairNg::API::DataTypes::Competition", required: false

				#  Count of markets associated with this competition
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

				#  Region in which this competition is happening
				# @!attribute [w]
				#
				field :competition_region, type: String, required: false

			end
		end
	end
end
