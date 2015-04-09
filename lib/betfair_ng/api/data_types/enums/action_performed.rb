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
				class ActionPerformed < Base

					def self.values
						[
              :NONE, #No action was performed since last heartbeat, or this is the first heartbeat
              :CANCELLATION_REQUEST_SUBMITTED, #A request to cancel all unmatched bets was submitted since last heartbeat
              :ALL_BETS_CANCELLED, #All unmatched bets were cancelled since last heartbeat
              :SOME_BETS_NOT_CANCELLED, #Not all unmatched bets were cancelled since last heartbeat
              :CANCELLATION_REQUEST_ERROR, #There was an error requesting cancellation, no bets have been cancelled
              :CANCELLATION_STATUS_UNKNOWN #There was no response from requesting cancellation, cancellation status unknown
						]
					end

				end
			end
		end
	end
end
