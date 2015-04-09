module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares MarketTypeResult
			#
			# == Fields
			#  - market_type
			#  - market_count
			#
			class MarketTypeResult < Base

				#  Market Type
				# @!attribute [w]
				#
				field :market_type, type: String, required: false

				#  Count of markets associated with this marketType
				# @!attribute [w]
				#
				field :market_count, type: Fixnum, required: false

			end
		end
	end
end
