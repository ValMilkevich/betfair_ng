module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ReplaceInstructionReport
			#
			# == Fields
			#  - status
			#  - error_code
			#  - cancel_instruction_report
			#  - place_instruction_report
			#
			class ReplaceInstructionReport < Base

				#  whether the command succeeded or failed
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::InstructionReportStatus", required: true

				#  cause of failure, or null if command succeeds
				# @!attribute [w]
				#
				field :error_code, type: "BetfairNg::API::DataTypes::Enums::InstructionReportErrorCode", required: false

				#  Cancelation report for the original order
				# @!attribute [w]
				#
				field :cancel_instruction_report, type: "BetfairNg::API::DataTypes::CancelInstructionReport", required: false

				#  Placement report for the new order
				# @!attribute [w]
				#
				field :place_instruction_report, type: "BetfairNg::API::DataTypes::PlaceInstructionReport", required: false

			end
		end
	end
end
