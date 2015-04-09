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

				#  Declares PersistenceType
				#
				class PersistenceType < Base

					def self.values
						[
							:LAPSE, #Lapse the order when the market is turned in-play
							:PERSIST, #Persist the order to in-play. The bet will be place automatically into the in-play market at the start of the event.
							:MARKET_ON_CLOSE, #Put the order into the auction (SP) at turn-in-play
						]
					end

				end
			end
		end
	end
end
