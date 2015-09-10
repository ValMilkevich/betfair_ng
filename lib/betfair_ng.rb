require 'multi_json'
require 'ostruct'
require 'uri'
require 'net/https'
require 'active_support/concern'

module BetfairNg
  require "betfair_ng/base"
  require "betfair_ng/configuration"
  require "betfair_ng/session"
  require "betfair_ng/version"

  include Configuration
  #  Declares the module for API operations etc.
  #
  module API

    #  Declares module for Concers shared modules
    #
    module Concerns
      require "betfair_ng/api/concerns/cache"      
      
      Gem.find_files("betfair_ng/api/concerns/*.rb", false).each {|file| require file }
    end

    #  Declares module for Types shared modules
    #
    module DataTypes
      include BetfairNg::API::Concerns::Aliases

      #  Declares module for Enums shared modules
      #
      module Enums
        require 'betfair_ng/api/data_types/enums/base.rb'
        Gem.find_files("betfair_ng/api/data_types/enums/*.rb", false).each {|file| require file }
      end

      require 'betfair_ng/api/data_types/base.rb'
      Gem.find_files("betfair_ng/api/data_types/*.rb", false).each {|file| require file }
    end

    #  Declares module for Operations
    #
    module Operations
      Gem.find_files("betfair_ng/api/operations/*.rb", false).each {|file| require file }

      include BetfairNg::API::Concerns::Aliases

      #  Declares module for all Auth operations
      #
      module Auth
        Gem.find_files("betfair_ng/api/operations/auth/*.rb", false).each {|file| require file }
      end

      #  Declares module for all Auth operations
      #
      module Betting
        Gem.find_files("betfair_ng/api/operations/betting/*.rb", false).each {|file| require file }
      end

      #  Declares module for all Accounts operations
      #
      module Accounts
        Gem.find_files("betfair_ng/api/operations/accounts/*.rb", false).each {|file| require file }
      end

      #  Declares module for all Heartbeat operations
      #
      module Heartbeat
        Gem.find_files("betfair_ng/api/operations/heartbeat/*.rb", false).each {|file| require file }
      end
    end
  end

  #  Declares the module for Cache providers
  #
  module Cache
    require "betfair_ng/cache/simple"
  end

  module Generators
    if defined?(Rails)
      Gem.find_files("generators/*.rb", false).each {|file| require file }
    end
  end

end
