module BetfairNg
  #  Declares the module for API interactions
  #
  module API

    #  Declares Concerns module for all API operations
    #
    module Concerns

      #  Declares Aliases module for all API operations
      #
      module Aliases
        extend ActiveSupport::Concern

        #  To make classes to appear as if API::DataTypes::... instead of Concersn::Aliases
        #
        self.included do
          class_eval(
            "MarketType = String
            Venue = String
            MarketId = String
            SelectionId = Fixnum
            Handicap = Float
            EventId = String
            EventTypeId = String
            CountryCode = String
            ExchangeId = String
            CompetitionId = String
            Price = Float
            Size = Float
            BetId = String
            MatchId = String

            class List < Array; end
            class Set < Array; end
            class Map < Array; end
            class Boolean;end"
          )
        end

      end
    end
  end
end
