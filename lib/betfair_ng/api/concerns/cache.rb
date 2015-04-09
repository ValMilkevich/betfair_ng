module BetfairNg

  #  Declares the module for API interactions
  #
  module API
    module Concerns

      #  Declares shared module for all API HTTP methods
      #
      module Cache
        extend ActiveSupport::Concern

        #  Presents a wrapper that caches the block results based on the cache_key
        #
        def with_cache(object, exp, &block)
          if self.cache_storage
            key = cache_key(object, exp)

            value = self.cache_storage.get( key )
            value ||= self.cache_storage.set( key, block.call )

            self.cache_storage.expire!(exp)
            value
          else
            block.call
          end
        end

        def cache_storage
          raise NotImplementedError.new("#cache_store method should be defined.")
        end

        protected

        #  Presents a cache_key to be used to store values
        #
        def cache_key(object, exp)
          "#{ (Time.now.to_i / exp).round }_#{ Digest::SHA256.base64digest(object.to_yaml) }"
        end

      end
    end
  end
end