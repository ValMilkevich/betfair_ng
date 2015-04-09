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

				#  Declares ItemClass
				#
				class ItemClass < Base

					def self.values
						[
							:UNKNOWN, #Statement item not mapped to a specific class. All values will be concatenated into a single key/value pair. The key will be 'unknownStatementItem' and the value will be a comma separated string. 
						]
					end

				end
			end
		end
	end
end
