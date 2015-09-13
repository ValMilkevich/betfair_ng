module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ApplicationSubscription
			#
			#  Application subscription details
			#
			# == Fields
			#  - subscription_token
			#  - expiry_date_time
			#  - expired_date_time
			#  - created_date_time
			#  - activation_date_time
			#  - cancellation_date_time
			#  - subscription_status
			#  - client_reference
			#  - vendor_client_id
			#
			class ApplicationSubscription < Base

				#  Application key identifier
				# @!attribute [w]
				#
				field :subscription_token, type: String, required: true

				#  Subscription Expiry date
				# @!attribute [w]
				#
				field :expiry_date_time, type: Time, required: false

				#  Subscription Expired date
				# @!attribute [w]
				#
				field :expired_date_time, type: Time, required: false

				#  Subscription Create date
				# @!attribute [w]
				#
				field :created_date_time, type: Time, required: false

				#  Subscription Activation date
				# @!attribute [w]
				#
				field :activation_date_time, type: Time, required: false

				#  Subscription Cancelled date
				# @!attribute [w]
				#
				field :cancellation_date_time, type: Time, required: false

				#  Subscription status
				# @!attribute [w]
				#
				field :subscription_status, type: "BetfairNg::API::DataTypes::Enums::SubscriptionStatus", required: false

				#  Client reference
				# @!attribute [w]
				#
				field :client_reference, type: String, required: false

				#  Vendor client Id
				# @!attribute [w]
				#
				field :vendor_client_id, type: String, required: false


			end
		end
	end
end
