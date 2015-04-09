module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CountryCodeResult
			#
			# == Fields
			#  - country_code
			#  - market_count
			#
			class CountryCodeResult < Base

				#  The ISO-2 code for the event.  A list of ISO-2 codes is available via http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
				# @!attribute [w]
				#
				field :country_code, type: String, required: false

				#  Count of markets associated with this Country Code
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

			end
		end
	end
end
