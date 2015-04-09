module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares TimeRange
			#
			#  TimeRange
			#
			# == Fields
			#  - from
			#  - to
			#
			class TimeRange < Base

				#  from, format: ISO 8601)
				# @!attribute [w]
				#
				field :from, type: Date, required: false

				#  to, format: ISO 8601
				# @!attribute [w]
				#
				field :to, type: Date, required: false


			end
		end
	end
end
