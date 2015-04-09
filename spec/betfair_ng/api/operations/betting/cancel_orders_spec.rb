require 'spec_helper'

describe BetfairNg::API::Operations::Betting::CancelOrders do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :cancel_orders
    end

    subject { BetfairNg::API::Operations::Betting::CancelOrders::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/betting/json-rpc/v1')
      end
    end

    describe "#perform" do
      it "fails without required arguments" do
        subject.perform

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be false
      end
    end
  end
end