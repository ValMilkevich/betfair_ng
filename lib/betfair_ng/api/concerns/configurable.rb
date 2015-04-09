module BetfairNg
  #  Declares the module for API interactions
  #
  module API
    module Concerns
      #  Declares shared module for all API operations
      #
      module Configurable
        extend ActiveSupport::Concern

        included do |base|

          #  Help method, draws interactive help
          #
          def self.help
            {
              Request: self.parent::Request.help,
              Response: self.parent::Response.help
            }
          end

          #  Help method, draws interactive help
          #
          def help
            {
              Dictionary: self.class.help,
              CurrentState: {
                Request: self.request,
                Response: self.response,
                Operation: self
              }
            }
          end

          class << self
            attr_accessor :operation
          end
        end

        module ClassMethods
          def configure
            self.operation ||= OpenStruct.new
            yield(operation)
          end
        end

      end
    end
  end
end
