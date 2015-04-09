module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares StatementItem
			#
			#  Summary of a cleared order.
			#
			# == Fields
			#  - ref_id
			#  - item_date
			#  - amount
			#  - balance
			#  - item_class
			#  - item_class_data
			#  - legacy_data
			#
			class StatementItem < Base

				#  An external reference, eg. equivalent to betId in the case of an exchange bet statement item.
				# @!attribute [w]
				#
				field :ref_id, type: String, required: false

				#  The date and time of the statement item, eg. equivalent to settledData for an exchange bet statement item. (in ISO-8601 format, not translated)
				# @!attribute [w]
				#
				field :item_date, type: Date, required: true

				#  The amount of money the balance is adjusted by
				# @!attribute [w]
				#
				field :amount, type: Float, required: false

				#  Account balance.
				# @!attribute [w]
				#
				field :balance, type: Float, required: false

				#  Class of statement item. This value will determine which set of keys will be included in itemClassData
				# @!attribute [w]
				#
				field :item_class, type: "BetfairNg::API::DataTypes::Enums::ItemClass", required: false

				#  Key value pairs describing the current statement item. The set of keys will be determined by the itemClass
				# @!attribute [w]
				#
				field :item_class_data, type: "BetfairNg::API::DataTypes::Map", of: OpenStruct, required: false

				#  Set of fields originally returned from APIv6. Provided to facilitate migration from APIv6 to API-NG, and ultimately onto itemClass and itemClassData
				# @!attribute [w]
				#
				field :legacy_data, type: "BetfairNg::API::DataTypes::StatementLegacyData", required: false


			end
		end
	end
end
