require 'spec_helper'

describe BetfairNg::API::Operations::Accounts::GetAccountDetails do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :get_account_details
      stub :certlogin
      session.create
    end

    subject { BetfairNg::API::Operations::Accounts::GetAccountDetails::Operation.new( config: config, session: session ) }

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
        expect(subject.http_data.result.keys).to eq( ["currencyCode", "firstName", "lastName", "localeCode", "region", "timezone", "discountRate", "pointsBalance", "countryCode"])
      end

      it 'sets the response' do
        subject.perform
        expect(subject.response.class).to eq(BetfairNg::API::Operations::Accounts::GetAccountDetails::Response)
        expect(subject.response[:error]).to be_nil
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform

        expect(subject.data.keys).to eq([:currency_code, :first_name, :last_name, :locale_code, :region, :timezone, :discount_rate, :points_balance, :country_code])
      end
    end
  end
end