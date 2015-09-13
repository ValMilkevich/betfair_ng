module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CurrentOrderSummary
			#
			# == Fields
			#  - bet_id
			#  - market_id
			#  - selection_id
			#  - handicap
			#  - price_size
			#  - bsp_liability
			#  - side
			#  - status
			#  - persistence_type
			#  - order_type
			#  - placed_date
			#  - matched_date
			#  - average_price_matched
			#  - size_matched
			#  - size_remaining
			#  - size_lapsed
			#  - size_cancelled
			#  - size_voided
			#  - regulator_auth_code
			#  - regulator_code
			#
			class CurrentOrderSummary < Base

				#  The bet ID of the original place order.
				# @!attribute [w]
				#
				field :bet_id, type: String, required: true

				#  The market id the order is for.
				# @!attribute [w]
				#
				field :market_id, type: String, required: true

				#  The selection id the order is for.
				# @!attribute [w]
				#
				field :selection_id, type: Fixnum, required: true

				#  The handicap associated with the runner in case of Asian handicap markets, null otherwise.
				# @!attribute [w]
				#
				field :handicap, type: Float, required: true

				#  The price and size of the bet.
				# @!attribute [w]
				#
				field :price_size, type: "BetfairNg::API::DataTypes::PriceSize", required: true

				#  Not to be confused with size. This is the liability of a given BSP bet.
				# @!attribute [w]
				#
				field :bsp_liability, type: Float, required: true

				#  BACK/LAY
				# @!attribute [w]
				#
				field :side, type: "BetfairNg::API::DataTypes::Enums::Side", required: true

				#  Either EXECUTABLE (an unmatched amount remains) or EXECUTION_COMPLETE (no unmatched amount remains).
				# @!attribute [w]
				#
				field :status, type: "BetfairNg::API::DataTypes::Enums::OrderStatus", required: true

				#  What to do with the order at turn-in-play.
				# @!attribute [w]
				#
				field :persistence_type, type: "BetfairNg::API::DataTypes::Enums::PersistenceType", required: true

				#  BSP Order type.
				# @!attribute [w]
				#
				field :order_type, type: "BetfairNg::API::DataTypes::Enums::OrderType", required: true

				#  The date, to the second, the bet was placed.
				# @!attribute [w]
				#
				field :placed_date, type: Time, required: true

				#  The date, to the second, of the last matched bet fragment (where applicable)
				# @!attribute [w]
				#
				field :matched_date, type: Time, required: true

				#  The average price matched at. Voided match fragments are removed from this average calculation. The price is automatically adjusted in the event of non runners being declared with applicable reduction factors.
				# @!attribute [w]
				#
				field :average_price_matched, type: Float, required: false

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

				#  The regulator authorisation code.
				# @!attribute [w]
				#
				field :regulator_auth_code, type: String, required: false

				#  The regulator Code.
				# @!attribute [w]
				#
				field :regulator_code, type: String, required: false

			end
		end
	end
end
