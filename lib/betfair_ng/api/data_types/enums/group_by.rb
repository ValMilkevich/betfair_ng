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

				#  Declares GroupBy
				#
				class GroupBy < Base

					def self.values
						[
							:EVENT_TYPE, #A roll up of settled P&L, commission paid and number of bet orders, on a specified event type
							:EVENT, #A roll up of settled P&L, commission paid and number of bet orders, on a specified event
							:MARKET, #A roll up of settled P&L, commission paid and number of bet orders, on a specified market
							:SIDE, #An averaged roll up of settled P&L, and number of bets, on the specified side of a specified selection within a specified market, that are either settled or voided
							:BET, #The P&L, commission paid, side and regulatory information etc, about each individual bet order
						]
					end

				end
			end
		end
	end
end
