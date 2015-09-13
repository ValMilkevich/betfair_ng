module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares PlaceInstructionReport
			#
			# == Fields
			#  - status
			#  - error_code
			#  - instruction
			#  - bet_id
			#  - placed_date
			#  - average_price_matched
			#  - size_matched
			#
			class PlaceInstructionReport < Base

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
				field :instruction, type: "BetfairNg::API::DataTypes::PlaceInstruction", required: true

				#  The bet ID of the new bet. May be null on failure.
				# @!attribute [w]
				#
				field :bet_id, type: String, required: false

				#  The date on which the bet was placed
				# @!attribute [w]
				#
				field :placed_date, type: Time, required: false

				#  The average price matched
				# @!attribute [w]
				#
				field :average_price_matched, type: Float, required: false

				#  The size matched.
				# @!attribute [w]
				#
				field :size_matched, type: Float, required: false

			end
		end
	end
end
