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

## Usage

Initialize base
    betfair = BetfairNg::Base.new({locale: :ru})

Create session
    betfair.session.create

List all Event types
    betfair.perform('betting/list_event_types', {})

List all Soccer Events
    betfair.perform('betting/list_events', {event_type_ids: [1]})


## Contributing

1. Fork it ( https://github.com/ValMilkevich/betfair_ng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
# betfair_ng
