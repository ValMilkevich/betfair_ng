module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares StatementLegacyData
			#
			#  Summary of a cleared order.
			#
			# == Fields
			#  - avg_price
			#  - bet_size
			#  - bet_type
			#  - bet_category_type
			#  - commission_rate
			#  - event_id
			#  - event_type_id
			#  - full_market_name
			#  - gross_bet_amount
			#  - market_name
			#  - market_type
			#  - placed_date
			#  - selection_id
			#  - selection_name
			#  - start_date
			#  - transaction_type
			#  - transaction_id
			#  - win_lose
			#
			class StatementLegacyData < Base

				#  The average matched price of the bet (null if no part has been matched)
				# @!attribute [w]
				#
				field :avg_price, type: Float, required: false

				#  The amount of the stake of your bet. (0 for commission payments or deposit/withdrawals)
				# @!attribute [w]
				#
				field :bet_size, type: Float, required: false

				#  Back or lay
				# @!attribute [w]
				#
				field :bet_type, type: String, required: false

				#  Exchange, Market on Close SP bet, or Limit on Close SP bet.
				# @!attribute [w]
				#
				field :bet_category_type, type: String, required: false

				#  Commission rate on market
				# @!attribute [w]
				#
				field :commission_rate, type: String, required: false

				#  Please note: this is the Id of the market without the associated exchangeId
				# @!attribute [w]
				#
				field :event_id, type: Fixnum, required: false

				#  Event Type
				# @!attribute [w]
				#
				field :event_type_id, type: Fixnum, required: false

				#  Full Market Name. For card payment items, this field contains the card name
				# @!attribute [w]
				#
				field :full_market_name, type: String, required: false

				#  Gross Bet Amount
				# @!attribute [w]
				#
				field :gross_bet_amount, type: Float, required: false

				#  Market Name. For card transactions, this field indicates the type of card transaction (deposit, deposit fee, or withdrawal).
				# @!attribute [w]
				#
				field :market_name, type: String, required: false

				#  Market type - please see Chapter 61. For account deposits and withdrawals, marketType is set to NOT_APPLICABLE.
				# @!attribute [w]
				#
				field :market_type, type: String, required: false

				#  Date and time of bet placement
				# @!attribute [w]
				#
				field :placed_date, type: Time, required: false

				#  Id of the selection (this will be the same for the same selection across markets)
				# @!attribute [w]
				#
				field :selection_id, type: Fixnum, required: false

				#  Name of the selection
				# @!attribute [w]
				#
				field :selection_name, type: String, required: false

				#  Date and time at the bet portion was settled
				# @!attribute [w]
				#
				field :start_date, type: Time, required: false

				#  Debit or credit
				# @!attribute [w]
				#
				field :transaction_type, type: String, required: false

				#   
				# @!attribute [w]
				#
				field :transaction_id, type: Fixnum, required: false

				#  Win or loss
				# @!attribute [w]
				#
				field :win_lose, type: String, required: false


			end
		end
	end
end
