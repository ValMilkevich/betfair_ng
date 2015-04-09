require 'ostruct'

module BetfairNg
  #  Declares the module for API interactions
  #
  module API

    #  Declares shared module for all API operations
    #
    module DataTypes

      #  Declares shared class for all API operations
      #
      class Base < OpenStruct
        include BetfairNg::API::Concerns::Field
        include BetfairNg::API::Concerns::Serialization
      end
    end

  end
end
