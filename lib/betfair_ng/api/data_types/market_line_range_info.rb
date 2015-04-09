module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketLineRangeInfo
			#
			# == Fields
			#  - max_unit_value
			#  - min_unit_value
			#  - interval
			#  - market_unit
			#
			class MarketLineRangeInfo < Base

				#  maxPrice
				# @!attribute [w]
				#
				field :max_unit_value, type: Float, required: true

				#  minPrice
				# @!attribute [w]
				#
				field :min_unit_value, type: Float, required: true

				#  interval
				# @!attribute [w]
				#
				field :interval, type: Float, required: true

				#  unit
				# @!attribute [w]
				#
				field :market_unit, type: String, required: true

			end
		end
	end
end
