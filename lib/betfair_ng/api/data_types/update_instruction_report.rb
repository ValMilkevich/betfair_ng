module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares UpdateInstructionReport
			#
			# == Fields
			#  - status
			#  - error_code
			#  - instruction
			#
			class UpdateInstructionReport < Base

				#  whether the command succeeded or failed
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::InstructionReportStatus", required: true

				#  cause of failure, or null if command succeeds
				# @!attribute [w]
				#
				field :error_code, type: "BetfairNg::API::DataTypes::Enums::InstructionReportErrorCode", required: false

				#  The instruction that was requested
				# @!attribute [w]
				#
				field :instruction, type: "BetfairNg::API::DataTypes::UpdateInstruction", required: true

			end
		end
	end
end
