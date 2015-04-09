module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares Type Aliases
			#
			# == Fields
			#  - market_type
			#  - venue
			#  - market_id
			#  - selection_id
			#  - handicap
			#  - event_id
			#  - event_type_id
			#  - country_code
			#  - exchange_id
			#  - competition_id
			#  - price
			#  - size
			#  - bet_id
			#  - match_id
			#
			class TypeAliases < Base

				field :market_type, type: String, required: false

				field :venue, type: String, required: false

				field :market_id, type: String, required: false

				field :selection_id, type: Fixnum, required: false

				field :handicap, type: Float, required: false

				field :event_id, type: String, required: false

				field :event_type_id, type: String, required: false

				field :country_code, type: String, required: false

				field :exchange_id, type: String, required: false

				field :competition_id, type: String, required: false

				field :price, type: Float, required: false

				field :size, type: Float, required: false

				field :bet_id, type: String, required: false

				field :match_id, type: String, required: false

			end
		end
	end
end
