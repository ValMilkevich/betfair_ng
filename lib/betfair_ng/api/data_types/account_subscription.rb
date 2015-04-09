module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares AccountSubscription
			#
			#  Application subscription details
			#
			# == Fields
			#  - subscription_tokens
			#  - application_name
			#  - application_version_id
			#
			class AccountSubscription < Base

				#  Lis t of subscription token details
				# @!attribute [w]
				#
				field :subscription_tokens, type: "BetfairNg::API::DataTypes::List", of: "BetfairNg::API::DataTypes::SubscriptionTokenInfo", required: true

				#  Application name
				# @!attribute [w]
				#
				field :application_name, type: String, required: false

				#  Application version Id
				# @!attribute [w]
				#
				field :application_version_id, type: String, required: false


			end
		end
	end
end
