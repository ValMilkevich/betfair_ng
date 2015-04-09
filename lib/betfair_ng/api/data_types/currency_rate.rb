module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CurrencyRate
			#
			#   Currency rate
			#
			# == Fields
			#  - currency_code
			#  - rate
			#
			class CurrencyRate < Base

				#  Three letter ISO 4217 code
				# @!attribute [w]
				#
				field :currency_code, type: String, required: false

				#  Exchange rate for the currency specified in the request
				# @!attribute [w]
				#
				field :rate, type: Float, required: false


			end
		end
	end
end
