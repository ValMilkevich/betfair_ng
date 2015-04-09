module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketCatalogue
			#
			# == Fields
			#  - market_id
			#  - market_name
			#  - market_start_time
			#  - description
			#  - total_matched
			#  - runners
			#  - event_type
			#  - competition
			#  - event
			#
			class MarketCatalogue < Base

				#  The unique identifier for the market. MarketId's are prefixed with '1.' or '2.' 1. = UK Exchange 2. = AUS Exchange.
				# @!attribute [w]
				#
				field :market_id, type: String, required: true

				#  The name of the market
				# @!attribute [w]
				#
				field :market_name, type: String, required: true

				#  The time this market starts at, only returned when the MARKET_START_TIME enum is passed in the marketProjections
				# @!attribute [w]
				#
				field :market_start_time, type: Date, required: false

				#  Details about the market
				# @!attribute [w]
				#
				field :description, type: "BetfairNg::API::DataTypes::MarketDescription", required: false

				#  The total amount of money matched on the market
				# @!attribute [w]
				#
				field :total_matched, type: Float, required: false

				#  The runners (selections) contained in the market
				# @!attribute [w]
				#
				field :runners, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::RunnerCatalog", required: false

				#  The Event Type the market is contained within
				# @!attribute [w]
				#
				field :event_type, type: "BetfairNg::API::DataTypes::EventType", required: false

				#  The competition the market is contained within. Usually only applies to Football competitions
				# @!attribute [w]
				#
				field :competition, type: "BetfairNg::API::DataTypes::Competition", required: false

				#  The event the market is contained within
				# @!attribute [w]
				#
				field :event, type: "BetfairNg::API::DataTypes::Event", required: false

			end
		end
	end
end
