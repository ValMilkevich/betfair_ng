module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares PriceProjection
			#
			# == Fields
			#  - price_data
			#  - ex_best_offers_overrides
			#  - virtualise
			#  - rollover_stakes
			#
			class PriceProjection < Base

				#  The basic price data you want to receive in the response.
				# @!attribute [w]
				#
				field :price_data, type: BetfairNg::API::DataTypes::Set, of: "BetfairNg::API::DataTypes::Enums::PriceData", required: false

				#  Options to alter the default representation of best offer prices Applicable to EX_BEST_OFFERS priceData selection
				# @!attribute [w]
				#
				field :ex_best_offers_overrides, type: "BetfairNg::API::DataTypes::ExBestOffersOverrides", required: false

				#  Indicates if the returned prices should include virtual prices. Applicable to EX_BEST_OFFERS and EX_ALL_OFFERS priceData selections, default value is false.
				# @!attribute [w]
				#
				field :virtualise, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  Indicates if the volume returned at each price point should be the absolute value or a cumulative sum of volumes available at the price and all better prices. If unspecified defaults to false. Applicable to EX_BEST_OFFERS and EX_ALL_OFFERS price projections. Not supported as yet.
				# @!attribute [w]
				#
				field :rollover_stakes, type: "BetfairNg::API::DataTypes::Boolean", required: false

			end
		end
	end
end
