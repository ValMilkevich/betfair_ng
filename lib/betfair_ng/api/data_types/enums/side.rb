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

				#  Declares Side
				#
				class Side < Base

					def self.values
						[
							:BACK, #To back a team, horse or outcome is to bet on the selection to win.
							:LAY, #To lay a team, horse, or outcome is to bet on the selection to lose.
						]
					end

				end
			end
		end
	end
end
