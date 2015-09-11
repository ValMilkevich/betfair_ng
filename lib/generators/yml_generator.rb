require 'rails/generators'

module BetfairNg
  #  Declares the module for the generators
  #
  module Generators

    class YmlGenerator < Rails::Generators::Base
      desc "This generator creates an initializer config/initializers/betfair.rb and config/betfair_ng.yml"
      source_root File.expand_path("../templates", __FILE__)

      def create_initializer_file
        template "betfair_ng.yml", "config/betfair_ng.yml"
      end
    end

  end
end
