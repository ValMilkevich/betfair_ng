module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares EventTypeResult
			#
			# == Fields
			#  - event_type
			#  - market_count
			#
			class EventTypeResult < Base

				#  The ID identifying the Event Type
				# @!attribute [w]
				#
				field :event_type, type: "BetfairNg::API::DataTypes::EventType", required: false

				#  Count of markets associated with this eventType
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

			end
		end
	end
end
