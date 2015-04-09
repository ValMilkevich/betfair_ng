module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares RunnerCatalog
			#
			# == Fields
			#  - selection_id
			#  - runner_name
			#  - handicap
			#  - sort_priority
			#  - metadata
			#
			class RunnerCatalog < Base

				#  The unique id for the selection.
				# @!attribute [w]
				#
				field :selection_id, type: Fixnum, required: true

				#  The name of the runner
				# @!attribute [w]
				#
				field :runner_name, type: String, required: true

				#  The handicap
				# @!attribute [w]
				#
				field :handicap, type: Float, required: true

				#  The sort priority of this runner
				# @!attribute [w]
				#
				field :sort_priority, type: Fixnum, required: true

				#  Metadata associated with the runner.  For a description of this data for Horse Racing, please see Runner Metadata Description
				# @!attribute [w]
				#
				field :metadata, type: BetfairNg::API::DataTypes::Map, of: [String, String], required: false

			end
		end
	end
end
