module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares AccountFundsResponse
			#
			#  Response for retrieving available to bet.
			#
			# == Fields
			#  - available_to_bet_balance
			#  - exposure
			#  - retained_commission
			#  - exposure_limit
			#  - discount_rate
			#  - points_balance
			#
			class AccountFundsResponse < Base

				#  Amount available to bet.
				# @!attribute [w]
				#
				field :available_to_bet_balance, type: Float, required: false

				#  Current exposure.
				# @!attribute [w]
				#
				field :exposure, type: Float, required: false

				#  Sum of retained commission.
				# @!attribute [w]
				#
				field :retained_commission, type: Float, required: false

				#  Exposure limit.
				# @!attribute [w]
				#
				field :exposure_limit, type: Float, required: false

				#  User Discount Rate.
				# @!attribute [w]
				#
				field :discount_rate, type: Float, required: false

				#  The Betfair points balance
				# @!attribute [w]
				#
				field :points_balance, type: Fixnum, required: false


			end
		end
	end
end
