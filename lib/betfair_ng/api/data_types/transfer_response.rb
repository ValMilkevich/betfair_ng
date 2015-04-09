module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares TransferResponse
			#
			#  Transfer operation response
			#
			# == Fields
			#  - transaction_id
			#
			class TransferResponse < Base

				#  The id of the transfer transaction that will be used in tracking the transfers between the wallets
				# @!attribute [w]
				#
				field :transaction_id, type: String, required: true


			end
		end
	end
end
