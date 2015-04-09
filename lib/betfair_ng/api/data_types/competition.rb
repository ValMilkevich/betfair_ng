module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares Competition
			#
			# == Fields
			#  - id
			#  - name
			#
			class Competition < Base

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
