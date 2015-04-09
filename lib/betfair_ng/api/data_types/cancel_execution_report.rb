module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CancelExecutionReport
			#
			# == Fields
			#  - customer_ref
			#  - status
			#  - error_code
			#  - market_id
			#  - instruction_reports
			#
			class CancelExecutionReport < Base

				#  Echo of the customerRef if passed.
				# @!attribute [w]
				#
				field :customer_ref, type: String, required: false

				#   
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::ExecutionReportStatus", required: true

				#   
				# @!attribute [w]
				#
				field :error_code, type: "BetfairNg::API::DataTypes::Enums::ExecutionReportErrorCode", required: false

				#  Echo of marketId passed
				# @!attribute [w]
				#
				field :market_id, type: String, required: false

				#   
				# @!attribute [w]
				#
				field :instruction_reports, type: "BetfairNg::API::DataTypes::List", of: "BetfairNg::API::DataTypes::CancelInstructionReport", required: false

			end
		end
	end
end
