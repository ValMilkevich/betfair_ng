module BetfairNg
  #  Declares the a class to store session manipulation methods
  #
  class Session < Base

    # Holds reference for config, operation, session_token
    #
    attr_accessor :operation, :updated_at

    #  Attempts to create a new session
    #
    def create
      self.operation = API::Operations::Auth::Certlogin::Operation.new( config: self.config )
      self.operation.perform

      if self.operation.success?
        self.updated_at = Time.now
        self.config.token = self.operation.token
      else
        self.config.token = nil
      end

      self
    end

    #  Attempts to refresh the token
    #
    def keep_alive
      self.operation = API::Operations::Auth::KeepAlive::Operation.new( config: self.config )
      self.operation.perform

      if self.operation.success?
        self.updated_at = Time.now
        self.config.token = self.operation.token
      else
        self.config.token = nil
      end
    end

    # Atempts to logout from the current session
    #
    def logout
      self.operation = API::Operations::Auth::Logout::Operation.new( config: self.config )
      self.operation.perform

      if self.operation.success?
        self.updated_at = Time.now
        self.config.token = nil
      else
        self.config.token = self.operation.token
      end
    end

    #  Performs a custom operation given by name
    #
    def perform(operation_name, params = {})
      @operation = operation_by_name(operation_name)

      # Sharing the same cache
      #
      @operation.config.set_cache_storage :session, self.config.cache_storage
      @operation.perform(params)
      @operation
    end

    #  Shows help for the operation
    #
    def help(operation_name = nil)
      puts ({
        Operations: {
          Betting: BetfairNg::API::Operations::Betting.constants,
          Accounts: BetfairNg::API::Operations::Accounts.constants,
          Auth: BetfairNg::API::Operations::Auth.constants,
          Heartbeat: BetfairNg::API::Operations::Heartbeat.constants
        }
      }.tap do |hash|
        hash[operation_name] = operation_by_name(operation_name).help if operation_name
      end).to_yaml
    end

    #  Returns operation by name
    #
    def operation_by_name(name)
      "BetfairNg::API::Operations::#{name.camelize}::Operation".constantize.new( config: self.config )
    end

  end
end
