require 'spec_helper'

describe BetfairNg::API::Operations::Accounts::GetAccountFunds do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :get_account_funds
      stub :certlogin
      session.create
    end

    subject { BetfairNg::API::Operations::Accounts::GetAccountFunds::Operation.new( config: config, session: session ) }

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
        expect(subject.http_data.result.keys).to eq(["availableToBetBalance", "exposure", "retainedCommission", "exposureLimit", "discountRate", "pointsBalance", "wallet"])
      end

      it 'sets the response' do
        subject.perform
        expect(subject.response.class).to eq(BetfairNg::API::Operations::Accounts::GetAccountFunds::Response)
        expect(subject.response[:error]).to be_nil
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform

        expect(subject.data.keys).to eq([:available_to_bet_balance, :exposure, :retained_commission, :exposure_limit, :discount_rate, :points_balance])
      end
    end
  end
end