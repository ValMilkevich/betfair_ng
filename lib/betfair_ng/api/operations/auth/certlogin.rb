module BetfairNg

  #  Declares the module for API interactions
  #
  module API

    #  Declares module for all operations
    #
    module Operations

      #  Declares module for all Betting operations
      #
      module Auth

        #  Declares class for Certlogin operation
        #
        module Certlogin
          class Response < Base::Response
            field :result, type: OpenStruct
          end

          class Request < Base::Request
          end

          class Operation < Base::Operation
            configure do |operation|
              operation.endpoint_prefix = "/api/certlogin"
              operation.http_method = :post
              operation.responder = Response
            end

            #  Stores body information
            #
            def request( params = {} )
              {
                username: self.config.username,
                password: self.config.password
              }
            end

            #  Returns if operation succeded
            #
            def success?
              super && self.http_data["loginStatus"] == "SUCCESS"
            end

            #  Returns session token
            #
            def token
              @token ||= self.success? ? self.http_data["sessionToken"] : nil
            end
          end

        end
      end
    end
  end
end