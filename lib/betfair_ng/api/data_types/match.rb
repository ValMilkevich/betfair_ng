module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares Match
			#
			# == Fields
			#  - bet_id
			#  - match_id
			#  - side
			#  - price
			#  - size
			#  - match_date
			#
			class Match < Base

				#  Only present if no rollup
				# @!attribute [w]
				#
				field :bet_id, type: String, required: false

				#  Only present if no rollup
				# @!attribute [w]
				#
				field :match_id, type: String, required: false

				#  Indicates if the bet is a Back or a LAY
				# @!attribute [w]
				#
				field :side, type: "BetfairNg::API::DataTypes::Enums::Side", required: true

				#  Either actual match price or avg match price depending on rollup.
				# @!attribute [w]
				#
				field :price, type: Float, required: true

				#  Size matched at in this fragment, or at this price or avg price depending on rollup
				# @!attribute [w]
				#
				field :size, type: Float, required: true

				#  Only present if no rollup
				# @!attribute [w]
				#
				field :match_date, type: Time, required: false

			end
		end
	end
end
