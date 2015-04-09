module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares PriceSize
			#
			# == Fields
			#  - price
			#  - size
			#
			class PriceSize < Base

				#  The price available
				# @!attribute [w]
				#
				field :price, type: Float, required: true

				#  The stake available
				# @!attribute [w]
				#
				field :size, type: Float, required: true

			end
		end
	end
end
