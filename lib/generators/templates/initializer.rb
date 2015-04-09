BetfairNg.configure do |config|
  # HTTPS is the only supported options
  config.protocol = "https"
  # Available options are: au | it | com
  config.country = "com"
  # Available options are: en | en_GB | bg | da | de | el | es | it | pt | ru | sv
  config.locale = "en"
  # Your application key, retrieved from Betfair
  config.application_key = "APPKEY"
  # Path to your certificate
  config.ssl_cert_path = "/config/betfair-client-2048.crt"
  # Path to your key
  config.ssl_key_path = "/config/betfair-client-2048.key"
  # Your betfair username
  config.username = "username"
  # Your betfair password
  config.password = "password"
  # Cache adapter
  config.cache = "simple"
end