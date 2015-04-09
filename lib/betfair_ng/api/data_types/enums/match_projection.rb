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

				#  Declares MatchProjection
				#
				class MatchProjection < Base

					def self.values
						[
							:NO_ROLLUP, #No rollup, return raw fragments
							:ROLLED_UP_BY_PRICE, #Rollup matched amounts by distinct matched prices per side.
							:ROLLED_UP_BY_AVG_PRICE, #Rollup matched amounts by average matched price per side
						]
					end

				end
			end
		end
	end
end
