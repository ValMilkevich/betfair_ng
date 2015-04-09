module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketFilter
			#
			# == Fields
			#  - text_query
			#  - exchange_ids
			#  - event_type_ids
			#  - event_ids
			#  - competition_ids
			#  - market_ids
			#  - venues
			#  - bsp_only
			#  - turn_in_play_enabled
			#  - in_play_only
			#  - market_betting_types
			#  - market_countries
			#  - market_type_codes
			#  - market_start_time
			#  - with_orders
			#
			class MarketFilter < Base

				#  Restrict markets by any text associated with the market such as the Name, Event, Competition, etc. You can include a wildcard (*) character as long as it is not the first character.
				# @!attribute [w]
				#
				field :text_query, type: String, required: false

				#  Restrict markets by the Exchange where the market operates. Not currently in use, requests for Australian markets should be sent to the Aus Exchange endpoint.
				# @!attribute [w]
				#
				field :exchange_ids, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict markets by event type associated with the market. (i.e., Football, Hockey, etc)
				# @!attribute [w]
				#
				field :event_type_ids, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict markets by the event id associated with the market.
				# @!attribute [w]
				#
				field :event_ids, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict markets by the competitions associated with the market.
				# @!attribute [w]
				#
				field :competition_ids, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict markets by the market id associated with the market.
				# @!attribute [w]
				#
				field :market_ids, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict markets by the venue associated with the market. Currently only Horse Racing markets have venues.
				# @!attribute [w]
				#
				field :venues, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict to bsp markets only, if True or non-bsp markets if False. If not specified then returns both BSP and non-BSP markets
				# @!attribute [w]
				#
				field :bsp_only, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  Restrict to markets that will turn in play if True or will not turn in play if false. If not specified, returns both.
				# @!attribute [w]
				#
				field :turn_in_play_enabled, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  Restrict to markets that are currently in play if True or are not currently in play if false. If not specified, returns both.
				# @!attribute [w]
				#
				field :in_play_only, type: "BetfairNg::API::DataTypes::Boolean", required: false

				#  Restrict to markets that match the betting type of the market (i.e. Odds, Asian Handicap Singles, or Asian Handicap Doubles
				# @!attribute [w]
				#
				field :market_betting_types, type: BetfairNg::API::DataTypes::Set, of: "BetfairNg::API::DataTypes::Enums::MarketBettingType", required: false

				#  Restrict to markets that are in the specified country or countries
				# @!attribute [w]
				#
				field :market_countries, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict to markets that match the type of the market (i.e., MATCH_ODDS, HALF_TIME_SCORE). You should use this instead of relying on the market name as the market type codes are the same in all locales
				# @!attribute [w]
				#
				field :market_type_codes, type: BetfairNg::API::DataTypes::Set, of: String, required: false

				#  Restrict to markets with a market start time before or after the specified date
				# @!attribute [w]
				#
				field :market_start_time, type: "BetfairNg::API::DataTypes::TimeRange", required: false

				#  Restrict to markets that I have one or more orders in these status.
				# @!attribute [w]
				#
				field :with_orders, type: BetfairNg::API::DataTypes::Set, of: "BetfairNg::API::DataTypes::Enums::OrderStatus", required: false

			end
		end
	end
end
