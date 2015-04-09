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

				#  Declares SubscriptionStatus
				#
				class SubscriptionStatus < Base

					def self.values
						[
							:ALL, #Any subscription status
							:ACTIVATED, #Only activated subscriptions
							:UNACTIVATED, #Only unactivated subscriptions
							:CANCELLED, #Only cancelled subscriptions
							:EXPIRED, #Only expired subscriptions
						]
					end

				end
			end
		end
	end
end
