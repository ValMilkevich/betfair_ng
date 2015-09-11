require 'spec_helper'

describe BetfairNg::Configuration do
  include SharedHelper::Config

  describe '#class' do
    it "is a Module" do
      expect(BetfairNg::Configuration.class).to eq(Module)
    end
  end

  describe "Config" do
    it "creates from yaml" do
      klass = Class.new(){ include BetfairNg::Configuration }
      klass.configure('../../config/betfair_ng.yml')

      expect(klass.config).to be_kind_of(BetfairNg::Configuration::Config)
      expect(klass.config.cache_expiration).to eq(60)
    end

    it "creates from block" do
      klass = Class.new(){ include BetfairNg::Configuration }
      klass.configure do |conf|
        conf.cache_expiration = 120
      end

      expect(klass.config).to be_kind_of(BetfairNg::Configuration::Config)
      expect(klass.config.cache_expiration).to eq(120)
    end

    it "block overrides file" do
      klass = Class.new(){ include BetfairNg::Configuration }
      klass.configure('../../config/betfair_ng.yml') do |conf|
        conf.cache_expiration = 120
      end

      expect(klass.config).to be_kind_of(BetfairNg::Configuration::Config)
      expect(klass.config.cache_expiration).to eq(120)
      expect(klass.config.username).to be_present
    end
  end

  describe 'Config' do
    subject { config }

    describe "#class" do
      it "is a Class" do
        expect(BetfairNg::Configuration::Config.class).to eq(Class)
      end
    end

    describe "#initialize" do
      it "properly sets defaults" do
        config = BetfairNg::Configuration::Config.new

        expect(config.protocol).to eq(BetfairNg::Configuration::Config::DEFAULT_PROTOCOL)
        expect(config.locale).to eq(BetfairNg::Configuration::Config::DEFAULT_LOCALE)
      end

      it "overrides defaults" do
        config = BetfairNg::Configuration::Config.new(locale: "de", protocol: "http")

        expect(config.protocol).to eq("http")
        expect(config.locale).to eq("de")
      end

      it "properly sets cache storage by key" do
        config = BetfairNg::Configuration::Config.new(cache: :simple, cache_storage: {})

        expect(config.cache_storage).to be_kind_of(BetfairNg::Cache::Simple)
        expect(config.cache_storage.send :data).to eq({})

        config.cache_storage = {}
        expect(config.cache_storage).to be_kind_of(BetfairNg::Cache::Simple)
        expect(config.cache_storage.send :data).to eq({})
      end

      it "properly sets cache_storage" do
        config = BetfairNg::Configuration::Config.new(cache: :simple, cache_storage: {})

        config.set_cache_storage :not_so_simple, BetfairNg::Cache::Simple.new({})
        expect(config.cache).to eq(:not_so_simple)
        expect(config.cache_storage).to be_kind_of(BetfairNg::Cache::Simple)
        expect(config.cache_storage.send :data).to eq({})
      end
    end

    describe ".configure" do
      it "properly intializes self.config" do
        BetfairNg.config = nil
        BetfairNg.configure do |conf|
          conf.locale = "de"
        end

        expect(BetfairNg.config.locale).to eq("de")
      end
    end

    describe "#host" do
      subject { BetfairNg.configure('../../config/betfair_ng.yml') }
      it "raises if operation is not supported" do
        expect( subject.host('asdf')).to eq(nil)
      end

      it "returns a proper host for 'com' country" do
        expect(subject.host('betting')).to eq('api.betfair.com')
        expect(subject.host(:betting)).to eq('api.betfair.com')

        expect(subject.host('auth')).to eq('identitysso.betfair.com')
        expect(subject.host(:auth)).to eq('identitysso.betfair.com')
      end

      it "returns a proper host for 'au' country" do
        subject.country = 'au'

        expect(subject.host('betting')).to eq('api-au.betfair.com')
        expect(subject.host(:betting)).to eq('api-au.betfair.com')

        expect(subject.host('auth')).to eq('identitysso.betfair.com')
        expect(subject.host(:auth)).to eq('identitysso.betfair.com')
      end

      it "returns a proper host for 'it' country" do
        subject.country = 'it'

        expect(subject.host('betting')).to eq('api.betfair.com')
        expect(subject.host(:betting)).to eq('api.betfair.com')

        expect(subject.host('auth')).to eq('identitysso.betfair.it')
        expect(subject.host(:auth)).to eq('identitysso.betfair.it')
      end

    end

    describe "#protocol" do
      it "presents" do
        expect(subject.protocol).to eq("https")
      end
    end

    describe "#application_key" do
      it "presents" do
        expect(subject.application_key).to eq("j88ytx4Agw6DFX5k")
      end
    end

    describe "#username" do
      it "presents" do
        expect(subject.username).not_to be_empty
      end
    end

    describe "#password" do
      it "presents" do
        expect(subject.password).not_to be_empty
      end
    end

    describe "#ssl_cert_path" do
      it "presents" do
        expect(subject.ssl_cert_path).not_to be_empty
      end
    end

    describe "#ssl_key_path" do
      it "presents" do
        expect(subject.ssl_key_path).not_to be_empty
      end
    end

    describe "#country=" do
      it "does not raise if not valid country provided" do
        expect{subject.country = 'asdf'}.not_to raise_error
      end

      it "stores valid country" do
        subject.country = 'au'
        expect(subject.country).to eq("au")
      end
    end

  end
end