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

				#  Declares InstructionReportStatus
				#
				class InstructionReportStatus < Base

					def self.values
						[
							:SUCCESS, # 
							:FAILURE, # 
							:TIMEOUT, # 
						]
					end

				end
			end
		end
	end
end
