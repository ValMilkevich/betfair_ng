module BetfairNg
	#  Declares the module for API interactions
	#
	module API

		#  Declares Types container
		#
		module DataTypes

			#  Declares Enums container
			#
			module Enums

				#  Declares MarketBettingType
				#
				class MarketBettingType < Base

					def self.values
						[
							:ODDS, #Odds Market
							:LINE, #Line Market
							:RANGE, #Range Market
							:ASIAN_HANDICAP_DOUBLE_LINE, #Asian Handicap Market
							:ASIAN_HANDICAP_SINGLE_LINE, #Asian Single Line Market
							:FIXED_ODDS, #Sportsbook Odds Market. This type is deprecated and will be removed in future releases, when Sportsbook markets will be represented as ODDS market but with a different product type.
						]
					end

				end
			end
		end
	end
end
