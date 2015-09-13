module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares SubscriptionTokenInfo
			#
			#  Subscription token information
			#
			# == Fields
			#  - subscription_token
			#  - activated_date_time
			#  - expiry_date_time
			#  - expired_date_time
			#  - cancellation_date_time
			#  - subscription_status
			#
			class SubscriptionTokenInfo < Base

				#  Subscription token
				# @!attribute [w]
				#
				field :subscription_token, type: String, required: true

				#  Subscription Activated date
				# @!attribute [w]
				#
				field :activated_date_time, type: Time, required: false

				#  Subscription Expiry date
				# @!attribute [w]
				#
				field :expiry_date_time, type: Time, required: false

				#  Subscription Expired date
				# @!attribute [w]
				#
				field :expired_date_time, type: Time, required: false

				#  Subscription Cancelled date
				# @!attribute [w]
				#
				field :cancellation_date_time, type: Time, required: false

				#  Subscription status
				# @!attribute [w]
				#
				field :subscription_status, type: "BetfairNg::API::DataTypes::Enums::SubscriptionStatus", required: false


			end
		end
	end
end
