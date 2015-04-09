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

				#  Declares MarketStatus
				#
				class MarketStatus < Base

					def self.values
						[
							:INACTIVE, #The market has been created but isn't yet available.
							:OPEN, #The market is open for betting.
							:SUSPENDED, #The market is suspended and not available for betting.
							:CLOSED, #The market has been settled and is no longer available for betting.
						]
					end

				end
			end
		end
	end
end
