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

				#  Declares Wallet
				#
				class Wallet < Base

					def self.values
						[
							:UK, # The UK Exchange wallet
							:AUSTRALIAN, # The Australian Exchange wallet
						]
					end

				end
			end
		end
	end
end
