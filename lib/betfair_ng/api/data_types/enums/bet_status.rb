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

				#  Declares BetStatus
				#
				class BetStatus < Base

					def self.values
						[
							:SETTLED, #A matched bet that was settled normally
							:VOIDED, #A matched bet that was subsequently voided by Betfair, before, during or after settlement
							:LAPSED, #Unmatched bet that was cancelled by Betfair (for example at turn in play).
							:CANCELLED, #Unmatched bet that was cancelled by an explicit customer action.
						]
					end

				end
			end
		end
	end
end
