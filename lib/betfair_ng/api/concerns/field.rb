require 'ostruct'
require 'active_support/core_ext/string'

module BetfairNg
  #  Declares the module for API interactions
  #
  module API

    #  Declares shared module for concerns for API
    #
    module Concerns

      #  Declares a module for .field functionality
      #
      module Field
        extend ActiveSupport::Concern

        #  Extracts value either from Proc or a value
        #
        def proc_or_value( pov )
          if pov.is_a?(Proc)
            instance_eval(&pov)
          else
            pov
          end
        end

        #  Returns available keys as if it's a Hash
        #
        def keys
          data.keys
        end

        #  Return if it's empty?
        #
        def empty?
          data.keys.blank?
        end

        #  Returns data with all fields
        #
        def data
          self.class.fields.keys.inject({}) do |memo, name|
            value = if self.send(name).respond_to?(:data)
              self.send(name).data
            elsif( self.send(name).is_a?(Array) )
              self.send(name).map{|el| el.respond_to?(:data) ? el.data : el }
            else
              self.send(name)
            end
            memo[name] = value if !value.blank? || self.class.fields[name][:required]
            memo
          end
        end

        module ClassMethods

          #  Holds reference to available fields
          #
          attr_accessor :instance_fields

          #  Initializes fields accessor with []
          #
          def instance_fields
            @instance_fields ||= {}
          end

          #  Attempts to transform value to provided klass
          #
          def cast_value(value, hash)
            klass = hash[:type].is_a?(Class) ? hash[:type] : hash[:type].to_s.constantize

            result = case klass.to_s
              when "String"
                value.to_s
              when "Date"
                Time.parse(value.to_s).to_date
              when "Time"
                Time.parse(value.to_s)
              when "Fixnum"
                value.to_i
              when "Float"
                value.to_f
              when "BetfairNg::API::DataTypes::Boolean"
                value.to_s == "true"
              when "BetfairNg::API::DataTypes::Set", "BetfairNg::API::DataTypes::List", "Array"
                if hash[:of]
                  value.to_a.map{|el| cast_value(el, type: hash[:of]) }
                else
                  value.to_a
                end
              when "BetfairNg::API::DataTypes::Map"
                if hash[:of].is_a?(Array)
                  raise "Map definition and actual values doesn't match" if hash[:of].size != value.to_a.size
                  hash[:of].each_with_index.map{|kl, i| cast_value(value.to_a[i], type: kl) }
                else
                  value.to_a
                end
            else
              if klass.respond_to?(:new)
                if (klass.ancestors & [BetfairNg::API::DataTypes::Enums::Base, BetfairNg::API::DataTypes::Base]).present?
                  klass.new(value, hash)
                else
                  klass.new(value)
                end
              else
                raise NotImplementedError.new(klass.to_s)
              end
            end

            result
          end

          #  Returns if operation succeded
          #
          def field( *attrs )
            name, hash = attrs.first, attrs[1]

            self.instance_fields[name] = hash || {}

            #  Defines a method that corresponds to the field attribute and tries to make value of the implicit type
            #
            define_method("#{name}=") do |value|
              self[name] = self.class.cast_value(value, self.class.fields[name])
            end

            define_method("#{name}") do
              definition = self.class.fields[name]
              self[name] ||
              (definition[:default].is_a?(TrueClass) && definition[:type].to_s.constantize.try(:default)) ||
              self.proc_or_value(definition[:default])
            end

          end

          #  Presents a list of fields for this class including all ancestors's ones
          #
          def fields
            [
              *self.ancestors.map{|a| a.instance_fields if a.respond_to?(:instance_fields) }.compact
            ].inject({}){|memo, val| val.merge(memo)}
          end

          def help
            {}.tap do |memo|
              fields.each do |field, options|
                type_klass = (options[:type] || Object).to_s.constantize
                of_klass = (options[:of] || Object).to_s.constantize

                memo[field] = if type_klass.respond_to?(:help)
                  options.merge(type: type_klass.help)
                elsif of_klass.respond_to?(:help)
                  options.merge(of: of_klass.help)
                else
                  options
                end

              end
            end
          end

        end

        def initialize( *attrs )
          params = attrs.first.blank? ? {} : attrs.first

          super()

          params.keys.inject({}){|memo, key| memo[key.to_s.underscore] = params[key]; memo}.each do |key, value|
            self.send("#{key}=", value)
          end

        end
      end
    end
  end
end
