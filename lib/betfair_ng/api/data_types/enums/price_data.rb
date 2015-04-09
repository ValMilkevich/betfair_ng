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

				#  Declares PriceData
				#
				class PriceData < Base

					def self.values
						[
							:SP_AVAILABLE, #Amount available for the BSP auction.
							:SP_TRADED, #Amount traded in the BSP auction.
							:EX_BEST_OFFERS, #Only the best prices available for each runner, to requested price depth.
							:EX_ALL_OFFERS, #EX_ALL_OFFERS trumps EX_BEST_OFFERS if both settings are present
							:EX_TRADED, #Amount traded on the exchange.
						]
					end

				end
			end
		end
	end
end
