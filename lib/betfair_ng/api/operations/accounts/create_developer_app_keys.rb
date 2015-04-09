 module BetfairNg

   #  Declares the module for API interactions
   #
   module API

     #  Declares module for all operations
     #
     module Operations

       #  Declares module for all Betting operations
       #
       module Accounts

         # Create 2 application keys for given user; one active and the other delayed
         #
         module CreateDeveloperAppKeys
           #  Declares class for Request Handler for Cancel Order operation
           #
           class Request < Base::Request
             field :app_name, type: String, required: true
           end

           #  Declares class for Response Handler for Cancel Order operation
           #
           class Response < Base::Response
             field :result, type: "BetfairNg::API::DataTypes::DeveloperApp"
           end

           #  Declares class for Operation Configuration for Cancel Order operation
           #
           class Operation < Base::Operation
             configure do |operation|
               operation.name = "AccountAPING/v1.0/createDeveloperAppKeys"
               operation.endpoint_prefix = "/exchange/account/json-rpc/v1"
               operation.http_method = :post
               operation.responder = Response
               operation.requester = Request
             end

             #  Provides parameters for the request
             #
             def request_params(params = {})
               params
             end
           end
         end
       end
     end
   end
 end