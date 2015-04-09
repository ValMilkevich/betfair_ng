require 'spec_helper'

describe BetfairNg::API::Operations::Accounts::TransferFunds do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe "Operation" do
    before do
      stub :transfer_funds
      stub :transfer_funds_failed1
      stub :transfer_funds_failed2
      stub :certlogin

      session.create
    end

    subject { BetfairNg::API::Operations::Accounts::TransferFunds::Operation.new( config: config, session: session ) }

    describe "#endpoint" do
      it "has proper value" do
        expect(subject.endpoint).to eq('https://api.betfair.com/exchange/account/json-rpc/v1')
      end
    end

    describe "#perform" do

      it 'returns invalid response without amount' do
        expect(subject.perform(to: :AUSTRALIAN)).to be_empty
        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be false
        expect(subject.http_data.result).to be_kind_of(NilClass)
      end

      it 'returns invalid response without amount' do
        expect(subject.perform(amount: 10)).to be_empty

        expect(subject.http_code).to eq("200")
        expect(subject.success?).to be false
        expect(subject.http_data.result).to be_kind_of(NilClass)
      end


      it 'sets the response' do
        subject.perform(amount: 1000000, to: :AUSTRALIAN)

        expect(subject.response.class).to eq(BetfairNg::API::Operations::Accounts::TransferFunds::Response)
        expect(subject.response.error).to be_kind_of(BetfairNg::API::DataTypes::Exception)
        expect(subject.response.error.code).to eq("-32099")
      end

    end

    describe "#serialize" do
      it "properly sets the data attribute" do
        subject.perform(amount: 1000000, to: :AUSTRALIAN)

        expect(subject.data).to eq([])
      end
    end
  end
end