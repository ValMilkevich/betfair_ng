module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ReplaceInstruction
			#
			# == Fields
			#  - bet_id
			#  - new_price
			#
			class ReplaceInstruction < Base

				#  Unique identifier for the bet
				# @!attribute [w]
				#
				field :bet_id, type: String, required: true

				#  The price to replace the bet at
				# @!attribute [w]
				#
				field :new_price, type: Float, required: true

			end
		end
	end
end
