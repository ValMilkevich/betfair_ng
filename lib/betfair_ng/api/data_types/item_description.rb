module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ItemDescription
			#
			# == Fields
			#  - event_type_desc
			#  - event_desc
			#  - market_desc
			#  - market_start_time
			#  - runner_desc
			#  - number_of_winners
			#
			class ItemDescription < Base

				#  The event type name, translated into the requested locale. Available at EVENT_TYPE groupBy or lower.
				# @!attribute [w]
				#
				field :event_type_desc, type: String, required: false

				#  The eventName, or openDate + venue, translated into the requested locale. Available at EVENT groupBy or lower.
				# @!attribute [w]
				#
				field :event_desc, type: String, required: false

				#  The market name or racing market type ("Win", "To Be Placed (2 places)", "To Be Placed (5 places)" etc) translated into the requested locale. Available at MARKET groupBy or lower.
				# @!attribute [w]
				#
				field :market_desc, type: String, required: false

				#  The start time of the market (in ISO-8601 format, not translated). Available at MARKET groupBy or lower.
				# @!attribute [w]
				#
				field :market_start_time, type: Date, required: false

				#  The runner name, maybe including the handicap, translated into the requested locale. Available at BET groupBy.
				# @!attribute [w]
				#
				field :runner_desc, type: String, required: false

				#  The numberOfWinners on a market. Available at BET groupBy.
				# @!attribute [w]
				#
				field :number_of_winners, type: Fixnum, required: false

			end
		end
	end
end
