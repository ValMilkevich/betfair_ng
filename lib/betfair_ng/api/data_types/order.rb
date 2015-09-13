module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares Order
			#
			# == Fields
			#  - bet_id
			#  - order_type
			#  - status
			#  - persistence_type
			#  - side
			#  - price
			#  - size
			#  - bsp_liability
			#  - placed_date
			#  - avg_price_matched
			#  - size_matched
			#  - size_remaining
			#  - size_lapsed
			#  - size_cancelled
			#  - size_voided
			#
			class Order < Base

				#   
				# @!attribute [w]
				#
				field :bet_id, type: String, required: true

				#  BSP Order type.
				# @!attribute [w]
				#
				field :order_type, type: "BetfairNg::API::DataTypes::Enums::OrderType", required: true

				#  Either EXECUTABLE (an unmatched amount remains) or EXECUTION_COMPLETE (no unmatched amount remains).
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::OrderStatus", required: true

				#  What to do with the order at turn-in-play
				# @!attribute [w]
				#
				field :persistence_type, type: "BetfairNg::API::DataTypes::Enums::PersistenceType", required: true

				#  Indicates if the bet is a Back or a LAY
				# @!attribute [w]
				#
				field :side, type: "BetfairNg::API::DataTypes::Enums::Side", required: true

				#  The price of the bet.
				# @!attribute [w]
				#
				field :price, type: Float, required: true

				#  The size of the bet.
				# @!attribute [w]
				#
				field :size, type: Float, required: true

				#  Not to be confused with size. This is the liability of a given BSP bet.
				# @!attribute [w]
				#
				field :bsp_liability, type: Float, required: true

				#  The date, to the second, the bet was placed.
				# @!attribute [w]
				#
				field :placed_date, type: Time, required: true

				#  The average price matched at. Voided match fragments are removed from this average calculation. For MARKET_ON_CLOSE BSP bets this reports the matched SP price following the SP reconciliation process.
				# @!attribute [w]
				#
				field :avg_price_matched, type: Float, required: false

				#  The current amount of this bet that was matched.
				# @!attribute [w]
				#
				field :size_matched, type: Float, required: false

				#  The current amount of this bet that is unmatched.
				# @!attribute [w]
				#
				field :size_remaining, type: Float, required: false

				#  The current amount of this bet that was lapsed.
				# @!attribute [w]
				#
				field :size_lapsed, type: Float, required: false

				#  The current amount of this bet that was cancelled.
				# @!attribute [w]
				#
				field :size_cancelled, type: Float, required: false

				#  The current amount of this bet that was voided.
				# @!attribute [w]
				#
				field :size_voided, type: Float, required: false

			end
		end
	end
end
