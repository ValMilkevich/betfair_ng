require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListClearedOrders do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_cleared_orders
    end

    subject { BetfairNg::API::Operations::Betting::ListClearedOrders::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/betting/json-rpc/v1')
      end
    end

    describe "#perform" do
      before do
        session.create
      end

      it 'returns valid response' do
        subject.perform

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).not_to be_empty
        expect(subject.http_data.result.keys).to eq(["clearedOrders", "moreAvailable"])
        expect(subject.http_data.result["clearedOrders"]).to eq([{"eventTypeId"=>"1", "eventId"=>"27393661", "marketId"=>"1.117733825", "selectionId"=>1561969, "handicap"=>0.0, "betId"=>"47793528580", "placedDate"=>"2015-03-20T14:17:39.000Z", "persistenceType"=>"LAPSE", "orderType"=>"LIMIT", "side"=>"BACK", "priceRequested"=>2.7, "settledDate"=>"2015-03-20T14:49:51.000Z", "betCount"=>1, "priceMatched"=>2.7, "priceReduced"=>false, "sizeSettled"=>4.66, "profit"=>-4.66}])
      end
    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data.keys).to eq([:cleared_orders, :more_available])
      end
    end

    describe "#request_params" do
      it "returns a proper hash with default values" do

        expect(subject.request[:params]).to eq({betStatus: :SETTLED})
        expect(subject.request(bet_ids: [1,2,3])[:params]).to eq({betStatus: :SETTLED, betIds: ["1", "2", "3"]})
        expect{subject.request(bet_ids: [1,2,3], group_by: 'asdf')[:params]}.to raise_error
        expect(subject.request(bet_ids: [1,2,3], group_by: 'EVENT_TYPE')[:params]).to eq({betStatus: :SETTLED, betIds: ["1", "2", "3"], groupBy: 'EVENT_TYPE'})
        expect(subject.request(bet_ids: [1,2,3], group_by: :EVENT_TYPE)[:params]).to eq({betStatus: :SETTLED, betIds: ["1", "2", "3"], groupBy: 'EVENT_TYPE'})
      end
    end
  end
end