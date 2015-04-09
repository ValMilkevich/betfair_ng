module BetfairNg
  #  Declares the basic class for all operations
  #
  class Base
    attr_accessor :config

    #  Initializes a new reference to BetfairNg config
    #
    def initialize( params = {})
      self.config = Configuration::Config.new(
        BetfairNg.config.to_h.merge(
          params[:config].to_h
        )
      )
    end

    def session
      @session ||= Session.new( config: self.config )
    end

  end
end
