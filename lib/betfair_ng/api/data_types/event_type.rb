module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares EventType
			#
			# == Fields
			#  - id
			#  - name
			#
			class EventType < Base

				#  id
				# @!attribute [w]
				#
				field :id, type: String, required: false

				#  name
				# @!attribute [w]
				#
				field :name, type: String, required: false

			end
		end
	end
end
