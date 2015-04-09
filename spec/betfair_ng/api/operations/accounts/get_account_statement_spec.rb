require 'spec_helper'

describe BetfairNg::API::Operations::Accounts::GetAccountStatement do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :get_account_statement
      stub :certlogin
      session.create
    end

    subject { BetfairNg::API::Operations::Accounts::GetAccountStatement::Operation.new( config: config, session: session ) }

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
        expect(subject.http_data.result.keys).to eq(["accountStatement", "moreAvailable"])
      end

      it 'sets the response' do
        subject.perform
        expect(subject.response.class).to eq(BetfairNg::API::Operations::Accounts::GetAccountStatement::Response)
        expect(subject.response[:error]).to be_nil
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform
        expect(subject.response).to be_kind_of(BetfairNg::API::Operations::Accounts::GetAccountStatement::Response)
        expect(subject.response.result).to be_kind_of(BetfairNg::API::DataTypes::AccountStatementReport)
      end
    end
  end
end