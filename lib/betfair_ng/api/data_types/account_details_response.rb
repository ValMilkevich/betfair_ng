module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares AccountDetailsResponse
			#
			#  Response for Account details.
			#
			# == Fields
			#  - currency_code
			#  - first_name
			#  - last_name
			#  - locale_code
			#  - region
			#  - timezone
			#  - discount_rate
			#  - points_balance
			#  - country_code
			#
			class AccountDetailsResponse < Base

				#  Default user currency Code.
				# @!attribute [w]
				#
				field :currency_code, type: String, required: false

				#  First Name.
				# @!attribute [w]
				#
				field :first_name, type: String, required: false

				#  Last Name.
				# @!attribute [w]
				#
				field :last_name, type: String, required: false

				#  Locale Code.
				# @!attribute [w]
				#
				field :locale_code, type: String, required: false

				#  Region based on users zip/postcode (ISO 3166-1 alpha-3 format). Defaults to GBR if zip/postcode cannot be identified.
				# @!attribute [w]
				#
				field :region, type: String, required: false

				#  User Time Zone.
				# @!attribute [w]
				#
				field :timezone, type: String, required: false

				#  User Discount Rate.
				# @!attribute [w]
				#
				field :discount_rate, type: Float, required: false

				#  The Betfair points balance.
				# @!attribute [w]
				#
				field :points_balance, type: Fixnum, required: false

				#  The customer's country of residence (ISO 2 Char format)
				# @!attribute [w]
				#
				field :country_code, type: String, required: false


			end
		end
	end
end
