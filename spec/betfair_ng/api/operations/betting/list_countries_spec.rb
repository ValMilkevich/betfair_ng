require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListCountries do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_countries
      stub :list_countries_with_market_ids
    end

    subject { BetfairNg::API::Operations::Betting::ListCountries::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/betting/json-rpc/v1')
      end
    end

    describe "#perform" do
      before do
        stub :certlogin
        session.create
      end

      it "calls HTTP request only once" do
        subject.perform
        subject.perform

        if respond_to?(:assert_requested)
          assert_requested :post, subject.endpoint, :times => 1
        end
      end

      it "calls HTTP multiple time with different params" do
        subject.cache_storage.expire!

        subject.perform
        subject.perform( filter: {market_ids: [123]})

        if respond_to?(:assert_requested)
          assert_requested :post, subject.endpoint, :times => 2
        end
      end


      it 'returns valid response' do
        subject.perform

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).not_to be_empty
      end
    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data.size).to eq(subject.http_data.result.size)
        expect(subject.data.first).to be_instance_of(BetfairNg::API::DataTypes::CountryCodeResult)
        expect(subject.data.first.country_code).to be_instance_of(String)
      end
    end

  end
end