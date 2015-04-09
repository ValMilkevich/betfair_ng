require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListCurrentOrders do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_current_orders
    end

    subject { BetfairNg::API::Operations::Betting::ListCurrentOrders::Operation.new( config: config, session: session ) }

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
        subject.perform

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).not_to be_empty
        expect(subject.http_data.result["currentOrders"]).not_to be_nil
        expect(subject.http_data.result["moreAvailable"]).not_to be_nil
      end
    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data[:current_orders]).to eq([])
      end
    end

    describe "#request_params" do
      it "returns a proper hash with default values" do

        expect(subject.request[:params]).to eq({})
        expect(subject.request(bet_ids: [1,2,3])[:params]).to eq({betIds: ["1", "2", "3"]})
        expect{subject.request(bet_ids: [1,2,3], order_by: 'asdf')[:params]}.to raise_error
        expect(subject.request(bet_ids: [1,2,3], order_by: 'EARLIEST_TO_LATEST')[:params]).to eq({betIds: ["1", "2", "3"], orderBy: 'EARLIEST_TO_LATEST'})
        expect(subject.request(bet_ids: [1,2,3], order_by: :EARLIEST_TO_LATEST)[:params]).to eq({betIds: ["1", "2", "3"], orderBy: 'EARLIEST_TO_LATEST'})
      end
    end
  end
end