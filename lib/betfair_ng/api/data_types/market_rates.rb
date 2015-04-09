module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketRates
			#
			# == Fields
			#  - market_base_rate
			#  - discount_allowed
			#
			class MarketRates < Base

				#  marketBaseRate
				# @!attribute [w]
				#
				field :market_base_rate, type: Float, required: true

				#  discountAllowed
				# @!attribute [w]
				#
				field :discount_allowed, type: "BetfairNg::API::DataTypes::Boolean", required: true

			end
		end
	end
end
