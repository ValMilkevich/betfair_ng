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

				#  Declares MarketSort
				#
				class MarketSort < Base

					def self.values
						[
							:MINIMUM_TRADED, #Minimum traded volume
							:MAXIMUM_TRADED, #Maximum traded volume
							:MINIMUM_AVAILABLE, #Minimum available to match
							:MAXIMUM_AVAILABLE, #Maximum available to match
							:FIRST_TO_START, #The closest markets based on their expected start time
							:LAST_TO_START, #The most distant markets based on their expected start time
						]
					end

				end
			end
		end
	end
end
