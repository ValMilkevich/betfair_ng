# BetfairNg

Simple gem to work with Betfair API NG

###** Super early alpha, use at your own risk **

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'betfair_ng', require: 'betfair_ng'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install betfair_ng

Run generator tasks to either generate ./config/betfair_ng.yml file or add config/initializers/betfair_ng.rb

    $ rails g betfair_ng:yml
Or
    $ rails g betfair_ng:initializer


## Betfair setup
Configure APP KEY: https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Application+Keys
Configure Non-Interactive login ( the only supported now ) https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Non-Interactive+%28bot%29+login

## Interactive Help 

### List of available operations:
    BetfairNg::Base.new.session.help

:Operations:
  - :Betting:
    - :Base
    - :CancelOrders
    - :ListClearedOrders
    - :ListCompetitions
    - :ListCountries
    - :ListCurrentOrders
    - :ListEventTypes
    - :ListEvents
    - :ListMarketBook
    - :ListMarketCatalogue
    - :ListMarketProfitAndLoss
    - :ListMarketTypes
    - :ListTimeRanges
    - :ListVenues
    - :Navigation
    - :PlaceOrders
    - :ReplaceOrders
    - :UpdateOrders
  - :Accounts:
    - :Base
    - :CreateDeveloperAppKeys
    - :GetAccountFunds
    - :GetAccountStatement
    - :GetAccountDetails
    - :GetDeveloperAppKeys
    - :ListCurrencyRates
    - :TransferFunds
  - :Auth:
    - :Base
    - :Certlogin
    - :KeepAlive
    - :Logout
  - :Heartbeat:
    - :Base
    - :Heartbeat

### Auth::Certlogin 

    BetfairNg::Base.new.session.help('auth/certlogin')
---
:Operations:
- :Betting:
  - :Base
  - :CancelOrders
  - :ListClearedOrders
  - :ListCompetitions
  - :ListCountries
  - :ListCurrentOrders
  - :ListEventTypes
  - :ListEvents
  - :ListMarketBook
  - :ListMarketCatalogue
  - :ListMarketProfitAndLoss
  - :ListMarketTypes
  - :ListTimeRanges
  - :ListVenues
  - :Navigation
  - :PlaceOrders
  - :ReplaceOrders
  - :UpdateOrders
- :Accounts:
  - :Base
  - :CreateDeveloperAppKeys
  - :GetAccountFunds
  - :GetAccountStatement
  - :GetAccountDetails
  - :GetDeveloperAppKeys
  - :ListCurrencyRates
  - :TransferFunds
- :Auth:
  - :Base
  - :Certlogin
  - :KeepAlive
  - :Logout
- :Heartbeat:
  - :Base
  - :Heartbeat
- auth/certlogin:
  - :Dictionary:
    - :Request: {}
    - :Response:
      - :error:
        - :type: !ruby/class 'String'
      - :result:
        - :type: !ruby/class 'OpenStruct'
  - :CurrentState:
    - :Request:
      - :username: username
      - :password: password
    - :Response: 
    - :Operation: !ruby/object:BetfairNg::API::Operations::Auth::Certlogin::Operation
      - config: !ruby/object:BetfairNg::Configuration::Config
        - table:
          - :cache: :simple
          - :cache_expiration: 60
          - :locale: :en
          - :country: :com
          - :protocol: https
          - :keys:
            - config/betfair_ng/client-2048.crt: !ruby/object:OpenSSL::X509::Certificate {}
            - config/betfair_ng/client-2048.key: !ruby/object:OpenSSL::PKey::RSA {}
          - :application_key: APP_KEY
          - :username: username
          - :password: password
          - :token: 
          - :ssl_key_path: config/betfair_ng/client-2048.key
          - :ssl_cert_path: config/betfair_ng/client-2048.crt
          - :host: betfair.com

## Usage

Initialize base
    betfair = BetfairNg::Base.new({locale: :ru})

Create session
    betfair.session.create

List all Event types
    betfair.session.perform('betting/list_event_types', {})

List all Soccer Events
    betfair.session.perform('betting/list_events', {event_type_ids: [1]})

## Contributing

1. Fork it ( https://github.com/ValMilkevich/betfair_ng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
# betfair_ng
