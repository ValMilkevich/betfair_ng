module BetfairNg

  #  Declares the module for Cache providers
  #
  module Cache

    #  Declares Simple cache storage
    #
    class Simple < Base

      #  Initializes data by a blank hash
      #
      def initialize( hash = {} )
        self.data = hash
      end

      #  Gets data by key
      #
      def get(key)
        self.data[key] && self.data[key][:value]
      end

      #  Sets data by key, value
      #
      def set(key, value)
        self.data[key] = { value: value, timestamp: Time.now.to_i }
        self.data[key][:value]
      end

      #  Clears all requests except of N most recent
      #
      def expire!(exp = 0)
        self.data.select{|a,b| b[:timestamp] <= Time.now.to_i - exp }.keys.map{ |key| self.data.delete(key) }
      end

      #  Returns size of the data
      #
      def size
        self.data.keys.size
      end

      protected

      def data
        @data ||= {}
      end

      def data= (val)
        @data = val
      end

    end
  end
end