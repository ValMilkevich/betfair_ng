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

				#  Declares IncludeItem
				#
				class IncludeItem < Base

					def self.values
						[
							:ALL, #Include all items
							:DEPOSITS_WITHDRAWALS, #Include payments only
							:EXCHANGE, #Include exchange bets only
							:POKER_ROOM, #Include poker transactions only
						]
					end

				end
			end
		end
	end
end
