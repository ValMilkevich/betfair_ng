module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares AccountStatementReport
			#
			#  A container representing search results.
			#
			# == Fields
			#  - account_statement
			#  - more_available
			#
			class AccountStatementReport < Base

				#  The list of statement items returned by your request.
				# @!attribute [w]
				#
				field :account_statement, type: "BetfairNg::API::DataTypes::List", of: "BetfairNg::API::DataTypes::StatementItem", required: true

				#  Indicates whether there are further result items beyond this page.
				# @!attribute [w]
				#
				field :more_available, type: "BetfairNg::API::DataTypes::Boolean", required: true


			end
		end
	end
end
