module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares LimitOrder
			#
			# == Fields
			#  - size
			#  - price
			#  - persistence_type
			#
			class LimitOrder < Base

				#  The size of the bet. Please note: For market type EACH_WAY. The total stake = size x 2
				# @!attribute [w]
				#
				field :size, type: Float, required: true

				#  The limit price
				# @!attribute [w]
				#
				field :price, type: Float, required: true

				#  What to do with the order at turn-in-play
				# @!attribute [w]
				#
				field :persistence_type, type: "BetfairNg::API::DataTypes::Enums::PersistenceType", required: true

			end
		end
	end
end
