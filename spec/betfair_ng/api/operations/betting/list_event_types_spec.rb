require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListEventTypes do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_event_types
    end

    subject { BetfairNg::API::Operations::Betting::ListEventTypes::Operation.new( config: config, session: session ) }

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
      end
    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data.size).to eq(34)
        expect(subject.data.first).to be_instance_of(BetfairNg::API::DataTypes::EventTypeResult)
        expect(subject.data.first.event_type).to be_instance_of(BetfairNg::API::DataTypes::EventType)
      end
    end
  end
end