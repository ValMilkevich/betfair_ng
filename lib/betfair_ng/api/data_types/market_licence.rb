module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketLicence
			#
			# == Fields
			#  - wallet
			#  - rules
			#  - rules_has_date
			#  - clarifications
			#
			class MarketLicence < Base

				#  The wallet from which funds will be taken when betting on this market
				# @!attribute [w]
				#
				field :wallet, type: String, required: true

				#  The rules for this market
				# @!attribute [w]
				#
				field :rules, type: String, required: false

				#  The market's start date and time are relevant to the rules.
				# @!attribute [w]
				#
				field :rules_has_date, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  Clarifications to the rules for the market
				# @!attribute [w]
				#
				field :clarifications, type: String, required: false

			end
		end
	end
end
