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

				#  Declares TimeGranularity
				#
				class TimeGranularity < Base

					def self.values
						[
							:DAYS, # 
							:HOURS, # 
							:MINUTES, # 
						]
					end

				end
			end
		end
	end
end
