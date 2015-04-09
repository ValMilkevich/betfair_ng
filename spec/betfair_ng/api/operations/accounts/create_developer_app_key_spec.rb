require 'spec_helper'

describe BetfairNg::API::Operations::Accounts::CreateDeveloperAppKeys do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :create_developer_app_keys
      stub :create_developer_app_keys_failed
      stub :certlogin
      session.create
    end

    subject { BetfairNg::API::Operations::Accounts::CreateDeveloperAppKeys::Operation.new( config: config ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/account/json-rpc/v1')
      end
    end

    describe "#perform" do

      it 'returns invalid response without app name' do
        subject.perform()
        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be false
        expect(subject.http_data.result).to eq(nil)
      end

      it 'returns invalid valid response with incorrect app_name' do
        subject.perform(app_name: "Test")
        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be false
        expect(subject.http_data.result).to eq(nil)
      end

      it 'sets the response' do
        subject.perform(app_name: "Test")
        expect(subject.response.class).to eq(BetfairNg::API::Operations::Accounts::CreateDeveloperAppKeys::Response)
        expect(subject.response[:error]).not_to be_nil
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform

        expect(subject.data).to eq([])
      end
    end
  end
end