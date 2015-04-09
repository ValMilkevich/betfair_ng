module BetfairNg
  #  Declares the module for API interactions
  #
  module API
    module Concerns
      #  Declares shared module for all API operations
      #
      module Serialization
        extend ActiveSupport::Concern
        #  Declares to_json conversion method
        #
        def to_json( hash = {} )
          convert_hash(self.serialize).to_json
        end

        # Returns data to be used
        #
        def serialize
          self.to_h
        end

        protected

        #  Transforms Hash or an Array to a format specified by #convert_hash_key
        #
        def convert_hash(value)
          case value
            when Array
              value.map { |v| convert_hash(v) }
              # or `value.map(&method(:convert_hash_keys))`
            when Hash
              Hash[value.map { |k, v| [convert_hash_key(k), convert_hash(v)] }]
            else
              value
           end
        end

        #  Converts string to a lower CamelCase format
        #
        def convert_hash_key(key)
          key.to_s.camelize(:lower).to_sym
        end

      end
    end
  end
end