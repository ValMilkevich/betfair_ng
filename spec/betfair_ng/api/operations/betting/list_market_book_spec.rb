require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListMarketBook do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_market_book
    end

    subject { BetfairNg::API::Operations::Betting::ListMarketBook::Operation.new( config: config, session: session ) }

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

      it 'returns valid response' do
        subject.perform(market_ids: ['58936827'])

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data[:result]).to eq([])
      end
    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform(market_ids: ['58936827'])

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data).to eq([])
      end
    end
  end
end