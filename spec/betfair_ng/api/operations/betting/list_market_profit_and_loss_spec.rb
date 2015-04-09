require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListMarketProfitAndLoss do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_market_profit_and_loss
    end

    subject { BetfairNg::API::Operations::Betting::ListMarketProfitAndLoss::Operation.new( config: config, session: session ) }

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

      it 'returns valid response when market_ids' do
        subject.perform(market_ids: ['58936827'])

        expect(subject.http_code).to eq("200" )
        expect(subject.success?).to be true
        expect(subject.data).to eq([])
      end

    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform(market_ids: ['58936827'])

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data.size).to eq(0)
      end
    end
  end
end