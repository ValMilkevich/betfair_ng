module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares TimeRangeResult
			#
			# == Fields
			#  - time_range
			#  - market_count
			#
			class TimeRangeResult < Base

				#  TimeRange
				# @!attribute [w]
				#
				field :time_range, type: "BetfairNg::API::DataTypes::TimeRange", required: false

				#  Count of markets associated with this TimeRange
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

			end
		end
	end
end
