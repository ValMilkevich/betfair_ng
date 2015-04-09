module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares DeveloperAppVersion
			#
			#  Describes a version of an external application
			#
			# == Fields
			#  - owner
			#  - version_id
			#  - version
			#  - application_key
			#  - delay_data
			#  - subscription_required
			#  - owner_managed
			#  - active
			#
			class DeveloperAppVersion < Base

				#  The sportex user who owns the specific version of the application
				# @!attribute [w]
				#
				field :owner, type: String, required: true

				#  The unique Id of the application version
				# @!attribute [w]
				#
				field :version_id, type: Fixnum, required: true

				#  The version identifier string such as 1.0, 2.0. Unique for a given application.
				# @!attribute [w]
				#
				field :version, type: String, required: true

				#  The unqiue application key associated with this application version
				# @!attribute [w]
				#
				field :application_key, type: String, required: true

				#  Indicates whether the data exposed by platform services as seen by this application key is delayed or realtime.
				# @!attribute [w]
				#
				field :delay_data, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  Indicates whether the application version needs explicit subscription
				# @!attribute [w]
				#
				field :subscription_required, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  Indicates whether the application version needs explicit management by the software owner. A value of false indicates, this is a version meant for personal developer use.
				# @!attribute [w]
				#
				field :owner_managed, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  Indicates whether the application version is currently active
				# @!attribute [w]
				#
				field :active, type: "BetfairNg::API::DataTypes::Boolean", required: true


			end
		end
	end
end
