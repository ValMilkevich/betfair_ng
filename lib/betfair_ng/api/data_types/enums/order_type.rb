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

				#  Declares OrderType
				#
				class OrderType < Base

					def self.values
						[
							:LIMIT, #A normal exchange limit order for immediate execution
							:LIMIT_ON_CLOSE, #Limit order for the auction (SP)
							:MARKET_ON_CLOSE, #Market order for the auction (SP)
						]
					end

				end
			end
		end
	end
end
