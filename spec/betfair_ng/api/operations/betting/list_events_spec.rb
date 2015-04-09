require 'spec_helper'

describe BetfairNg::API::Operations::Betting::ListEvents do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :certlogin
      stub :list_events
      stub :list_events_filtered
    end

    subject { BetfairNg::API::Operations::Betting::ListEvents::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/betting/json-rpc/v1')
      end
    end

    describe "#perform" do
      before do
        session.create
      end

      it "calls HTTP request only once" do
        subject.perform
        subject.perform
        assert_requested :post, subject.endpoint, :times => 1
      end

      it 'returns valid response' do
        subject.perform
        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).not_to be_empty
      end

      it "filters by event_id" do
        subject.perform(filter: {event_ids: [27406847, 27406215]})

        expect(subject.data.size).to be <= 2
      end
    end

    describe "#serialize" do
      it "properly sets the classes" do
        subject.perform

        expect(subject.data.class).to be_kind_of(Class)
        expect(subject.data.size).to be > 1
        expect(subject.data.first).to be_instance_of(BetfairNg::API::DataTypes::EventResult)
        expect(subject.data.first.event).to be_instance_of(BetfairNg::API::DataTypes::Event)
      end
    end
  end
end