module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares Event
			#
			# == Fields
			#  - id
			#  - name
			#  - country_code
			#  - timezone
			#  - venue
			#  - open_date
			#
			class Event < Base

				#  The unique id for the event
				# @!attribute [w]
				#
				field :id, type: String, required: false

				#  The name of the event
				# @!attribute [w]
				#
				field :name, type: String, required: false

				#  The ISO-2 code for the event.  A list of ISO-2 codes is available via http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
				# @!attribute [w]
				#
				field :country_code, type: String, required: false

				#  This is timezone in which the event is taking place.
				# @!attribute [w]
				#
				field :timezone, type: String, required: false

				#  venue
				# @!attribute [w]
				#
				field :venue, type: String, required: false

				#  The scheduled start date and time of the event. This is Europe/London (GMT) by default
				# @!attribute [w]
				#
				field :open_date, type: Time, required: false

			end
		end
	end
end
