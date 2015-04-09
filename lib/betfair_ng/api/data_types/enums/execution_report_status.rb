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

				#  Declares ExecutionReportStatus
				#
				class ExecutionReportStatus < Base

					def self.values
						[
							:SUCCESS, #Order processed successfully
							:FAILURE, #Order failed.
							:PROCESSED_WITH_ERRORS, #The order itself has been accepted, but at least one (possibly all) actions have generated errors. This error only occurs for replaceOrders, cancelOrders and updateOrders operations. The placeOrders operation will not return PROCESSED_WITH_ERRORS status as it is an atomic operation.
							:TIMEOUT, #Order timed out.
						]
					end

				end
			end
		end
	end
end
