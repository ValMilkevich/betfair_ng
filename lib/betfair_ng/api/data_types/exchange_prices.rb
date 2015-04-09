module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ExchangePrices
			#
			# == Fields
			#  - available_to_back
			#  - available_to_lay
			#  - traded_volume
			#
			class ExchangePrices < Base

				#   
				# @!attribute [w]
				#
				field :available_to_back, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::PriceSize", required: false

				#   
				# @!attribute [w]
				#
				field :available_to_lay, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::PriceSize", required: false

				#   
				# @!attribute [w]
				#
				field :traded_volume, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::PriceSize", required: false

			end
		end
	end
end
