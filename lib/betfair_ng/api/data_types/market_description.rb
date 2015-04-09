module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketDescription
			#
			# == Fields
			#  - persistence_enabled
			#  - bsp_market
			#  - market_time
			#  - suspend_time
			#  - settle_time
			#  - betting_type
			#  - turn_in_play_enabled
			#  - market_type
			#  - regulator
			#  - market_base_rate
			#  - discount_allowed
			#  - wallet
			#  - rules
			#  - rules_has_date
			#  - clarifications
			#
			class MarketDescription < Base

				#  If 'true' the market supports 'Keep' bets if the market is to be turned in-play
				# @!attribute [w]
				#
				field :persistence_enabled, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  If 'true' the market supports Betfair SP betting
				# @!attribute [w]
				#
				field :bsp_market, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  The market start time
				# @!attribute [w]
				#
				field :market_time, type: Date, required: true

				#  The market suspend time
				# @!attribute [w]
				#
				field :suspend_time, type: Date, required: true

				#  settled time
				# @!attribute [w]
				#
				field :settle_time, type: Date, required: false

				#  See MarketBettingType
				# @!attribute [w]
				#
				field :betting_type, type: "BetfairNg::API::DataTypes::Enums::MarketBettingType", required: true

				#  If 'true' the market is set to turn in-play
				# @!attribute [w]
				#
				field :turn_in_play_enabled, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  Market base type
				# @!attribute [w]
				#
				field :market_type, type: String, required: true

				#  The market regulator
				# @!attribute [w]
				#
				field :regulator, type: String, required: true

				#  The commission rate applicable to the market
				# @!attribute [w]
				#
				field :market_base_rate, type: Float, required: true

				#  Indicates whether or not the user's discount rate is taken into account on this market. If ‘false’ all users will be charged the same commission rate, regardless of discount rate.
				# @!attribute [w]
				#
				field :discount_allowed, type: "BetfairNg::API::DataTypes::Boolean", required: true

				#  The wallet to which the market belongs (UK/AUS)
				# @!attribute [w]
				#
				field :wallet, type: String, required: false

				#  The market rules.
				# @!attribute [w]
				#
				field :rules, type: String, required: false

				#   
				# @!attribute [w]
				#
				field :rules_has_date, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  Any additional information regarding the market
				# @!attribute [w]
				#
				field :clarifications, type: String, required: false

			end
		end
	end
end
