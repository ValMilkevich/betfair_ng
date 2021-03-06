module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares LimitOnCloseOrder
			#
			# == Fields
			#  - liability
			#  - price
			#
			class LimitOnCloseOrder < Base

				#  The size of the bet.
				# @!attribute [w]
				#
				field :liability, type: Float, required: true

				#  The limit price of the bet if LOC
				# @!attribute [w]
				#
				field :price, type: Float, required: true

			end
		end
	end
end
