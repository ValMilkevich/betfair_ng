module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketOnCloseOrder
			#
			# == Fields
			#  - liability
			#
			class MarketOnCloseOrder < Base

				#  The size of the bet.
				# @!attribute [w]
				#
				field :liability, type: Float, required: true

			end
		end
	end
end
