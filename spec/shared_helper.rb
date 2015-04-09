require 'yaml'

module SharedHelper
  module Config
    extend ActiveSupport::Concern

    module ClassMethods

      attr_accessor :env
      #  Returns if current tests should be run against real API ( "production" )
      #
      def env
        @env ||= "test"
      end

    end

    def default_config
      BetfairNg.configure('../../config/betfair.yml')

      @default_config = BetfairNg.config
    end

    def default_session
      @session = BetfairNg::Session.new( config: config )
      @session.create
      config.token = @session.config.token

      @session
    end

    self.included do |base|

      if self.env == "test"
        require 'webmock/rspec'

        WebMock.disable_net_connect!(allow_localhost: true)
      end

      base.let(:session) { default_session}
      base.let!(:config) { default_config }
    end

  end

  module Stubs
    extend ActiveSupport::Concern

    self.included do |base|
      def stub(name)
        if self.respond_to? :stub_request
          self.instance_eval(&STUBS[name]) if STUBS.key?(name)
        end
      end
    end

    def auth_headers
      headers.merge(
        'X-Authentication'=>'kY9tKAwxEjFZ7jHeNdE5Iy/hjVC9iCy7qptRuUR/Itw='
      )
    end

    def headers
      {
        'Accept'=>['*/*', 'application/json'],
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/x-www-form-urlencoded',
        'User-Agent'=>'Ruby',
        'X-Application'=>'yMOsRUnms1eEA2I1'
      }
    end

    def response_headers
      {"content-type"=>"application/json", "content-length"=>"115", "date"=>"Wed, 01 Apr 2015 19:48:49 GMT", "connection"=>"close"}
    end

    STUBS = {
      certlogin: Proc.new(){
        stub_request(:post, "https://identitysso.betfair.com/api/certlogin").
          with( :body => {"password"=> config.password, "username"=>config.username }, :headers => headers ).
          to_return(
           :status => 200,
           :body => "{\"sessionToken\":\"kY9tKAwxEjFZ7jHeNdE5Iy/hjVC9iCy7qptRuUR/Itw=\",\"loginStatus\":\"SUCCESS\"}",
           :headers => response_headers
          )
        },

      keep_alive: Proc.new(){
        stub_request(:get, "https://identitysso.betfair.com/api/keepAlive").
          with( :headers => auth_headers ).
         to_return( :status => 200, :body =>  "{\"token\":\"mk7Wsgn5qAKcYbbgn1g4u/NORYQvbotYPYpuajeNoBY=\",\"product\":\"yMOsRUnms1eEA2I1\",\"status\":\"SUCCESS\",\"error\":\"\"}", :headers => response_headers
         )
      },

      logout: Proc.new(){
        stub_request(:get, "https://identitysso.betfair.com/api/logout").with(headers: auth_headers).
        to_return(:status => 200, :body => "{\"token\":\"Qk8nSVAXG/gWV1hT48mXyR95K3CKpWJj4HUEM3ph5Mg=\",\"product\":\"yMOsRUnms1eEA2I1\",\"status\":\"SUCCESS\",\"error\":\"\"}", :headers => response_headers
          )
      },

      fail_logout: Proc.new(){
        stub = stub_request(:get, "https://identitysso.betfair.com/api/logout")
        stub = stub.with{ |request| !request.headers['X-Authentication'] }
        stub = stub.to_return(:status => 200, :body => "{\"token\":\"\",\"product\":\"yMOsRUnms1eEA2I1\",\"status\":\"FAIL\",\"error\":\"INPUT_VALIDATION_ERROR\"}", :headers => response_headers
          )
      },

      list_competitions: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                with(:body => {"{\"method\":\"SportsAPING/v1.0/ListCompetitions\",\"params\":{\"filter\":{},\"locale\":\"en\"}}"=>true}, :headers => auth_headers).to_return(:status => 200, :body => load_stub_file('list_competitions'), :headers => response_headers)
      },

      list_event_types: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listEventTypes\",\"params\":{\"filter\":{},\"locale\":\"en\"}}"=>true}, :headers => auth_headers).to_return(:status => 200, :body => load_stub_file('list_event_types'), :headers => response_headers)
      },

      list_countries: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                with(:body => {"{\"method\":\"SportsAPING/v1.0/listCountries\",\"params\":{\"filter\":{},\"locale\":\"en\"}}"=>true},
                     :headers => auth_headers ).
                to_return(:status => 200, :body => load_stub_file('list_countries'), :headers => {})
      },

      list_countries_with_market_ids: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                with(:body => {"{\"method\":\"SportsAPING/v1.0/listCountries\",\"params\":{\"filter\":{\"marketIds\":\"123\"},\"locale\":\"en\"}}"=>true},
                     :headers => auth_headers ).
                to_return(:status => 200, :body => load_stub_file('list_countries'), :headers => {})
      },

      list_current_orders: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listCurrentOrders\",\"params\":{}}"=>true},
                      :headers => auth_headers ).
                 to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":{\"currentOrders\":[],\"moreAvailable\":false}}", :headers => {})
      },

      list_cleared_orders: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listClearedOrders\",\"params\":{\"betStatus\":\"SETTLED\"}}"=>true},
                      :headers => auth_headers ).
                 to_return(:status => 200, :body => load_stub_file('list_cleared_orders'), :headers => {})
      },

      list_events: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/listEvents\",\"params\":{\"filter\":{},\"locale\":\"en\"}}"=>true},
               :headers => auth_headers ).
          to_return(:status => 200, :body => load_stub_file('list_events'), :headers => {})
      },

      list_events_filtered: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/listEvents\",\"params\":{\"filter\":{\"eventIds\":\"27406847\",\"27406215\"},\"locale\":\"en\"}}"=>true},
               :headers => auth_headers ).
          to_return(:status => 200, :body => load_stub_file('list_events_filtered'), :headers => {})
      },

      list_market_book: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listMarketBook\",\"params\":{\"marketIds\":\"58936827\",\"locale\":\"en\"}}"=>true},
                      :headers => auth_headers ).
                 to_return(:status => 200, :body => load_stub_file('list_market_book'), :headers => {})
      },

      list_market_catalogue: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listMarketCatalogue\",\"params\":{\"filter\":{},\"maxResults\":10,\"locale\":\"en\"}}"=>true},
                      :headers => auth_headers ).
                 to_return(:status => 200, :body => load_stub_file('list_market_catalogue'), :headers => {})
      },

      list_market_profit_and_loss: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listMarketProfitAndLoss\",\"params\":{\"marketIds\":\"58936827\"}}"=>true},
                      :headers => auth_headers).
                 to_return(:status => 200, :body => load_stub_file('list_market_profit_and_loss'), :headers => {})
      },

      list_market_types: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listMarketTypes\",\"params\":{\"filter\":{},\"locale\":\"en\"}}"=>true},
                      :headers => auth_headers).
                 to_return(:status => 200, :body => load_stub_file('list_market_types'), :headers => {})
      },

      list_time_ranges: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
                 with(:body => {"{\"method\":\"SportsAPING/v1.0/listTimeRanges\",\"params\":{\"filter\":{},\"granularity\":\"DAYS\"}}"=>true},
                      :headers => auth_headers).
                 to_return(:status => 200, :body => load_stub_file('list_time_ranges'),
                   :headers => {})
      },

      list_venues: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/listVenues\",\"params\":{\"filter\":{},\"locale\":\"en\"}}"=>true},
               :headers => auth_headers ).
          to_return(:status => 200, :body => load_stub_file('list_venues'), :headers => {})
      },

      place_orders: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/placeOrders\",\"params\":{\"marketId\":null,\"instructions\":null}}"=>true},
               :headers => auth_headers).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      cancel_orders: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/cancelOrders\",\"params\":{\"marketId\":null,\"instructions\":null}}"=>true},
               :headers => auth_headers).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      replace_orders: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/replaceOrders\",\"params\":{\"marketId\":null,\"instructions\":null}}"=>true},
               :headers => auth_headers).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      update_orders: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/betting/json-rpc/v1").
          with(:body => {"{\"method\":\"SportsAPING/v1.0/updateOrders\",\"params\":{\"marketId\":null,\"instructions\":null}}"=>true},
               :headers => auth_headers).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      navigation: Proc.new(){
        stub_request(:get, "https://api.betfair.com/exchange/betting/rest/v1/en/navigation/menu.json").
                 with(:headers => auth_headers ).
                 to_return(:status => 200, :body => load_stub_file('navigation'), :headers => {})
      },

      create_developer_app_keys: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/createDeveloperAppKeys\",\"params\":{\"appName\":\"Test\"}}"=>true},
               :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32099,\"message\":\"AANGX-0008\",\"data\":{\"AccountAPINGException\":{\"errorDetails\":\"\",\"errorCode\":\"APP_KEY_CREATION_FAILED\",\"requestUUID\":\"prdaan-288274-04050109-0000586a04\"},\"exceptionname\":\"AccountAPINGException\"}}}", :headers => {})

      },

      create_developer_app_keys_failed: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/createDeveloperAppKeys\",\"params\":{\"appName\":null}}"=>true},
               :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      get_account_details: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/getAccountDetails\",\"params\":{}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":{\"currencyCode\":\"USD\",\"firstName\":\"Val\",\"lastName\":\"Milkevich\",\"localeCode\":\"en\",\"region\":\"GBR\",\"timezone\":\"EET\",\"discountRate\":0.0,\"pointsBalance\":0,\"countryCode\":\"BY\"}}", :headers => {})
      },

      get_account_funds: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/getAccountFunds\",\"params\":{}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":{\"availableToBetBalance\":0.0,\"exposure\":0.0,\"retainedCommission\":0.0,\"exposureLimit\":-10000.0,\"discountRate\":0.0,\"pointsBalance\":0,\"wallet\":\"UK\"}}", :headers => {})
      },

      get_developer_app_keys: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/getDeveloperAppKeys\",\"params\":{}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":[{\"appName\":\"Valvee\",\"appId\":34559,\"appVersions\":[{\"owner\":\"valvee\",\"versionId\":25268,\"version\":\"1.0-DELAY\",\"applicationKey\":\"TEST\",\"delayData\":true,\"subscriptionRequired\":true,\"ownerManaged\":false,\"active\":true},{\"owner\":\"valvee\",\"versionId\":25267,\"version\":\"1.0\",\"applicationKey\":\"TEST\",\"delayData\":false,\"subscriptionRequired\":true,\"ownerManaged\":false,\"active\":true}]}]}", :headers => {})
      },

      get_account_statement: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/getAccountStatement\",\"params\":{}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":{\"accountStatement\":[{\"refId\":\"47793528580\",\"itemDate\":\"2015-03-20T14:49:51.000Z\",\"amount\":-4.66,\"balance\":0.0,\"itemClassData\":{\"unknownStatementItem\":\"{\\\"avgPrice\\\":2.7,\\\"betSize\\\":4.66,\\\"betType\\\":\\\"B\\\",\\\"betCategoryType\\\":\\\"E\\\",\\\"commissionRate\\\":null,\\\"eventId\\\":117733825,\\\"eventTypeId\\\":1,\\\"fullMarketName\\\":\\\"Fixtures 20 March     / Maccabi Herzliya v Bnei Yehuda/ Match Odds\\\",\\\"grossBetAmount\\\":0.0,\\\"marketName\\\":\\\"Match Odds\\\",\\\"marketType\\\":\\\"O\\\",\\\"placedDate\\\":\\\"2015-03-20T14:17:39.000Z\\\",\\\"selectionId\\\":1561969,\\\"selectionName\\\":\\\"Bnei Yehuda\\\",\\\"startDate\\\":\\\"0001-01-01T00:00:00.000Z\\\",\\\"transactionType\\\":\\\"ACCOUNT_DEBIT\\\",\\\"transactionId\\\":0,\\\"winLose\\\":\\\"RESULT_LOST\\\"}\"},\"legacyData\":{\"avgPrice\":2.7,\"betSize\":4.66,\"betType\":\"B\",\"betCategoryType\":\"E\",\"eventId\":117733825,\"eventTypeId\":1,\"fullMarketName\":\"Fixtures 20 March     / Maccabi Herzliya v Bnei Yehuda/ Match Odds\",\"grossBetAmount\":0.0,\"marketName\":\"Match Odds\",\"marketType\":\"O\",\"placedDate\":\"2015-03-20T14:17:39.000Z\",\"selectionId\":1561969,\"selectionName\":\"Bnei Yehuda\",\"startDate\":\"0001-01-01T00:00:00.000Z\",\"transactionType\":\"ACCOUNT_DEBIT\",\"transactionId\":0,\"winLose\":\"RESULT_LOST\"},\"itemClass\":\"UNKNOWN\"}],\"moreAvailable\":false}}", :headers => {})
      },

      list_currency_rates: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/listCurrencyRates\",\"params\":{}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":[{\"currencyCode\":\"USD\",\"rate\":1.482800006866455},{\"currencyCode\":\"GBP\",\"rate\":1.0},{\"currencyCode\":\"AUD\",\"rate\":1.954699993133545},{\"currencyCode\":\"EUR\",\"rate\":1.3590999841690063},{\"currencyCode\":\"CAD\",\"rate\":1.8569999933242798},{\"currencyCode\":\"HKD\",\"rate\":11.467499732971191},{\"currencyCode\":\"NOK\",\"rate\":11.836000442504883},{\"currencyCode\":\"SGD\",\"rate\":2.014699935913086},{\"currencyCode\":\"SEK\",\"rate\":12.774499893188477},{\"currencyCode\":\"DKK\",\"rate\":10.160099983215332}]}", :headers => {})
      },

      transfer_funds: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/transferFunds\",\"params\":{\"from\":\"UK\",\"to\":\"AUSTRALIAN\",\"amount\":1000000.0}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32099,\"message\":\"AANGX-0016\",\"data\":{\"AccountAPINGException\":{\"errorDetails\":\"The amount you specified to transfer is greater than the amount in the source wallet\",\"errorCode\":\"WALLET_TRANSFER_ERROR\",\"requestUUID\":\"prdaan-2882a0-04051559-0000176b79\"},\"exceptionname\":\"AccountAPINGException\"}}}", :headers => {})
      },

      transfer_funds_failed1: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/transferFunds\",\"params\":{\"from\":\"UK\",\"to\":\"AUSTRALIAN\",\"amount\":null}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      transfer_funds_failed2: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/account/json-rpc/v1").
          with(:body => {"{\"method\":\"AccountAPING/v1.0/transferFunds\",\"params\":{\"from\":\"UK\",\"to\":null,\"amount\":10.0}}"=>true},
                :headers => auth_headers ).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"error\":{\"code\":-32602,\"message\":\"DSC-0018\"}}", :headers => {})
      },

      heartbeat: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/heartbeat/json-rpc/v1").
          with(:body => {"{\"method\":\"HeartbeatAPING/v1.0/heartbeat\",\"params\":{\"preferredTimeoutSeconds\":300}}"=>true},
               :headers => auth_headers).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":{\"actualTimeoutSeconds\":300,\"actionPerformed\":\"NONE\"}}", :headers => {})
      },

      heartbeat2: Proc.new(){
        stub_request(:post, "https://api.betfair.com/exchange/heartbeat/json-rpc/v1").
          with(:body => {"{\"method\":\"HeartbeatAPING/v1.0/heartbeat\",\"params\":{\"preferredTimeoutSeconds\":30}}"=>true},
               :headers => auth_headers).
          to_return(:status => 200, :body => "{\"jsonrpc\":\"2.0\",\"result\":{\"actualTimeoutSeconds\":30,\"actionPerformed\":\"NONE\"}}", :headers => {})
      }

    }

    private

    def load_stub_file(name)
      File.read(
        File.join(
          File.dirname(__FILE__), "./stubs/#{name}.json"
        )
      )
    end

  end
end
