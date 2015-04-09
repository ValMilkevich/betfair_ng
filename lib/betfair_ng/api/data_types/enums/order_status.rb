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

				#  Declares OrderStatus
				#
				class OrderStatus < Base

					def self.values
						[
							:EXECUTION_COMPLETE, #An order that does not have any remaining unmatched portion.
							:EXECUTABLE, #An order that has a remaining unmatched portion.
						]
					end

				end
			end
		end
	end
end
