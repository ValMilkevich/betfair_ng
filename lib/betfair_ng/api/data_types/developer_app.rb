module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares DeveloperApp
			#
			#  Describes developer/vendor specific application
			#
			# == Fields
			#  - app_name
			#  - app_id
			#  - app_versions
			#
			class DeveloperApp < Base

				#  The unique name of the application
				# @!attribute [w]
				#
				field :app_name, type: String, required: true

				#  A unique id of this application
				# @!attribute [w]
				#
				field :app_id, type: Fixnum, required: true

				#  The application versions (including application keys)
				# @!attribute [w]
				#
				field :app_versions, type: "BetfairNg::API::DataTypes::List", of: "BetfairNg::API::DataTypes::DeveloperAppVersion", required: true


			end
		end
	end
end
