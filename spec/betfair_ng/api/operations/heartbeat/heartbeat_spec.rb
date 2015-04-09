require 'spec_helper'

describe BetfairNg::API::Operations::Heartbeat::Heartbeat do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :heartbeat
      stub :heartbeat2
      stub :certlogin
      session.create
    end

    subject { BetfairNg::API::Operations::Heartbeat::Heartbeat::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/heartbeat/json-rpc/v1')
      end
    end

    describe "#perform" do

      it 'is valid with the default timeout' do
        expect(subject.perform()).not_to be_empty

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).to eq({"actualTimeoutSeconds"=>300, "actionPerformed"=>"NONE"})
      end

      it 'overrides default timeout' do
        expect(subject.perform(preferred_timeout_seconds: 30)).not_to be_empty

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be true
        expect(subject.http_data.result).to eq({"actualTimeoutSeconds"=>30, "actionPerformed"=>"NONE"})
      end


      it 'sets the response' do
        subject.perform

        expect(subject.response.class).to eq(BetfairNg::API::Operations::Heartbeat::Heartbeat::Response)
        expect(subject.response[:error]).to be_nil
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform

        expect(subject.data).to be_kind_of(BetfairNg::API::DataTypes::HeartbeatReport)
        expect(subject.data.keys).to eq([:action_performed, :actual_timeout_seconds])
      end
    end
  end
end