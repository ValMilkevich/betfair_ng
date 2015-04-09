module BetfairNg

	#  Declares the module for API interactions
	#
	module API

		#  Declares the module for Data types
		#
		module DataTypes

			#  Declares ExBestOffersOverrides
			#
			# == Fields
			#  - best_prices_depth
			#  - rollup_model
			#  - rollup_limit
			#  - rollup_liability_threshold
			#  - rollup_liability_factor
			#
			class ExBestOffersOverrides < Base

				#  The maximum number of prices to return on each side for each runner. If unspecified defaults to 3.
				# @!attribute [w]
				#
				field :best_prices_depth, type: Fixnum, required: false

				#  The model to use when rolling up available sizes. If unspecified defaults to STAKE rollup model with rollupLimit of minimum stake in the specified currency.
				# @!attribute [w]
				#
				field :rollup_model, type: "BetfairNg::API::DataTypes::Enums::RollupModel", required: false

				#  The volume limit to use when rolling up returned sizes. The exact definition of the limit depends on the rollupModel. If no limit is provided it will use minimum stake as default the value. Ignored if no rollup model is specified.
				# @!attribute [w]
				#
				field :rollup_limit, type: Fixnum, required: false

				#  Only applicable when rollupModel is MANAGED_LIABILITY. The rollup model switches from being stake based to liability based at the smallest lay price which is >= rollupLiabilityThreshold.service level default (TBD). Not supported as yet.
				# @!attribute [w]
				#
				field :rollup_liability_threshold, type: Float, required: false

				#  Only applicable when rollupModel is MANAGED_LIABILITY. (rollupLiabilityFactor * rollupLimit) is the minimum liabilty the user is deemed to be comfortable with. After the rollupLiabilityThreshold price subsequent volumes will be rolled up to minimum value such that the liability >= the minimum liability.service level default (5). Not supported as yet.
				# @!attribute [w]
				#
				field :rollup_liability_factor, type: Fixnum, required: false

			end
		end
	end
end
