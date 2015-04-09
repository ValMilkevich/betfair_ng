module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares CurrentOrderSummaryReport
			#
			# == Fields
			#  - current_orders
			#  - more_available
			#
			class CurrentOrderSummaryReport < Base

				#  The list of current orders returned by your query. This will be a valid list (i.e. empty or non-empty but never 'null').
				# @!attribute [w]
				#
				field :current_orders, type: BetfairNg::API::DataTypes::List, of: "BetfairNg::API::DataTypes::CurrentOrderSummary", required: true

				#  Indicates whether there are further result items beyond this page. Note that underlying data is highly time-dependent and the subsequent search orders query might return an empty result.
				# @!attribute [w]
				#
				field :more_available, type: "BetfairNg::API::DataTypes::Boolean", required: true

			end
		end
	end
end
