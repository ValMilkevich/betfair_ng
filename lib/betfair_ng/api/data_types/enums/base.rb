module BetfairNg
	#  Declares the module for API interactions
	#
	module API
		#  Declares Types container
		#
		module DataTypes

			#  Declares Enums container
			#
			module Enums

				#  Declares OrderProjection
				#
				class Base
          include Concerns::Serialization
          attr_accessor :data

          #  Initializes class
          #
          def initialize( *attrs )
            value, options = normalize_attributes(attrs)

            if options[:default] && value.blank?
              value = options[:default].is_a?(TrueClass) ? self.class.default : options[:default]
            end

            if !validates?(value)
              raise ArgumentError.new(
                "Not supported: '#{value}' for #{self.class}. Available values are: #{ self.class.values.join(',') }"
              )
            end

            self.data = value.to_s
          end

          alias :to_h :data

          def to_json( hash = {} )
            self.data
          end

          #  Returns default value of the ENUM
          #
          def self.default
            self.values.first
          end

          private

          def validates?(value)
            self.class.values.map(&:to_s).include?(value.to_s)
          end

          def normalize_attributes(attrs)
            if attrs.first.is_a?(String)
              return attrs.first, attrs[1] || {}
            elsif attrs[1].is_a?(Hash)
              return attrs.first, attrs[1] || {}
            elsif attrs.first.is_a?(Hash)
              return attrs.first[:data], attrs.first.except(:data) || {}
            else
              return attrs.first, attrs[1] || {}
            end
          end
				end
			end
		end
	end
end
