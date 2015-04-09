module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Betting operations
      #
      module Betting

        # This Navigation Data for Applications service allows the retrieval of the full Betfair market navigation menu from a compressed file.
        #
        # The file can be accessed via https://api.betfair.com/exchange/betting/rest/v1/en/navigation/menu.json
        #
        module Navigation

          #  Declares class for Response Handler for Navigation operation
          #
          class Response < Base::Response
            field :result, type: OpenStruct
          end

          #  Declares class for Request Handler for Navigation operation
          #
          class Request < Base::Request
          end

          #  Declares class for Operation Handler for Navigation operation
          #
          class Operation < Base::Operation
            configure do |operation|
              operation.http_method = :get
              operation.responder = Response
            end

            #  Returns an endpoint for the API request
            #
            def endpoint
              "https://api.betfair.com/exchange/betting/rest/v1/#{self.config.locale}/navigation/menu.json"
            end

            #  Returns a request params to be sent
            #
            def request( params = {} )
              {}
            end

            #  Returns true if the operation succedeed
            #
            def success?
              !!self.http_data && self.http_code == '200' && self.http_data.error.blank?
            end

          end
        end
      end
    end
  end
end