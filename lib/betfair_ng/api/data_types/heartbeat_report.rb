module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ItemDescription
			#
			# == Fields
			#  - action_performed
			#  - actual_timeout_seconds
			#
			class HeartbeatReport < Base

				#  The action performed since your last heartbeat request.
				# @!attribute [w]
				#
				field :action_performed, type: "BetfairNg::API::DataTypes::Enums::ActionPerformed", required: true

				#  The actual timeout applied to your heartbeat request, see timeout request parameter description for details.
				# @!attribute [w]
				#
				field :actual_timeout_seconds, type: Fixnum, required: true

			end
		end
	end
end
