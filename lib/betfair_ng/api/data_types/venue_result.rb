module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares VenueResult
			#
			# == Fields
			#  - venue
			#  - market_count
			#
			class VenueResult < Base

				#  Venue
				# @!attribute [w]
				#
				field :venue, type: String, required: false

				#  Count of markets associated with this Venue
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

			end
		end
	end
end
