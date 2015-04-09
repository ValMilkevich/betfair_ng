require 'spec_helper'

describe BetfairNg::API::Operations::Accounts::ListCurrencyRates do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :list_currency_rates
      stub :certlogin
      session.create
    end

    subject { BetfairNg::API::Operations::Accounts::ListCurrencyRates::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/account/json-rpc/v1')
      end
    end

    describe "#perform" do

      it 'returns invalid response without app name' do
        expect(subject.perform()).not_to be_empty
        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).to be_kind_of(Array)
      end

      it 'sets the response' do
        subject.perform
        expect(subject.response.class).to eq(BetfairNg::API::Operations::Accounts::ListCurrencyRates::Response)
        expect(subject.response[:error]).to be_nil
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform

        expect(subject.data.first).to be_kind_of(BetfairNg::API::DataTypes::CurrencyRate)
      end
    end
  end
end