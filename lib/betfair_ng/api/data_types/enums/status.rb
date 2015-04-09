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

				#  Declares Status
				#
				class Status < Base

					def self.values
						[
							:SUCCESS, #Sucess status
						]
					end

				end
			end
		end
	end
end
