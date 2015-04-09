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

				#  Declares OrderProjection
				#
				class OrderProjection < Base

					def self.values
						[
							:ALL, #EXECUTABLE and EXECUTION_COMPLETE orders
							:EXECUTABLE, #An order that has a remaining unmatched portion
							:EXECUTION_COMPLETE, #An order that does not have any remaining unmatched portion
						]
					end

				end
			end
		end
	end
end
