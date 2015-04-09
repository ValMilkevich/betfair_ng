module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CancelInstructionReport
			#
			# == Fields
			#  - status
			#  - error_code
			#  - instruction
			#  - size_cancelled
			#  - cancelled_date
			#
			class CancelInstructionReport < Base

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
				field :instruction, type: "BetfairNg::API::DataTypes::CancelInstruction", required: false

				#   
				# @!attribute [w]
				#
				field :size_cancelled, type: Float, required: true

				#   
				# @!attribute [w]
				#
				field :cancelled_date, type: Date, required: false

			end
		end
	end
end
