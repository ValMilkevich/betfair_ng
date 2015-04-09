module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares UpdateInstruction
			#
			# == Fields
			#  - bet_id
			#  - new_persistence_type
			#
			class UpdateInstruction < Base

				#  Unique identifier for the bet
				# @!attribute [w]
				#
				field :bet_id, type: String, required: true

				#  The new persistence type to update this bet to
				# @!attribute [w]
				#
				field :new_persistence_type, type: "BetfairNg::API::DataTypes::Enums::PersistenceType", required: true

			end
		end
	end
end
