module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares EventResult
			#
			# == Fields
			#  - event
			#  - market_count
			#
			class EventResult < Base

				#  Event
				# @!attribute [w]
				#
				field :event, type: "BetfairNg::API::DataTypes::Event", required: false

				#  Count of markets associated with this event
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

			end
		end
	end
end
