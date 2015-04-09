require 'spec_helper'

describe BetfairNg::API::Operations::Auth::KeepAlive::Operation do
  include SharedHelper::Config
  include SharedHelper::Stubs

  before do
    stub :certlogin
    stub :keep_alive
  end

  subject { BetfairNg::API::Operations::Auth::KeepAlive::Operation.new( config: config, session: session ) }

  describe '#endpoint' do

    it 'should not raise' do
      expect{ subject.endpoint }.to_not raise_error
    end

    it 'equals to https://identitysso.betfair.com/api/keepAlive' do
      expect( subject.endpoint ).to eq('https://identitysso.betfair.com/api/keepAlive')
    end

    it 'is possible to override' do
      subject.endpoint = 'example'

      expect( subject.endpoint ).to eq('example')
    end
  end

  describe "#headers" do
    it 'doesn\'t change a Hash with X-Application after initialization' do
      session.config.token = 'ADSFASDFASDFSDF'
      expect( subject.http_headers['X-Application'] ).to eq('yMOsRUnms1eEA2I1')
      expect( subject.http_headers['X-Authentication'] ).not_to eq('ADSFASDFASDFSDF')
    end
  end

  describe "#request" do
    it 'returns blank hash' do
      expect( subject.request ).to eq({})
    end
  end

  describe "#perform" do
    before do
      stub :certlogin
      session.create
    end

    it 'not raises' do
      expect{ subject.perform }.to_not raise_error
    end

    it 'returns valid response' do
      subject.perform

      expect(subject.http_code).to eq("200")
      expect(subject.http_data["status"]).to eq("SUCCESS")
      expect(subject.http_data["token"]).not_to be_nil
    end
  end

end