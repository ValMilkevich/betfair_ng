module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CancelInstruction
			#
			# == Fields
			#  - bet_id
			#  - size_reduction
			#
			class CancelInstruction < Base

				#  The betId
				# @!attribute [w]
				#
				field :bet_id, type: String, required: true

				#  If supplied then this is a partial cancel.  Should be set to 'null' if no size reduction is required.
				# @!attribute [w]
				#
				field :size_reduction, type: Float, required: false

			end
		end
	end
end
