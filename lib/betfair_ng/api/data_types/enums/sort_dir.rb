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

				#  Declares SortDir
				#
				class SortDir < Base

					def self.values
						[
							:EARLIEST_TO_LATEST, #Order from earliest value to latest e.g. lowest betId is first in the results.
							:LATEST_TO_EARLIEST, #Order from the latest value to the earliest e.g. highest betId is first in the results.
						]
					end

				end
			end
		end
	end
end
