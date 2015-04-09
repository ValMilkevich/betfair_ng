require 'spec_helper'

describe BetfairNg::API::Operations::Auth::Certlogin::Operation do
  include SharedHelper::Config
  include SharedHelper::Stubs

  before do
    stub :certlogin
  end

  subject { BetfairNg::API::Operations::Auth::Certlogin::Operation.new( config: config ) }

  describe '#endpoint' do
    it 'should not raise' do
      expect{ subject.endpoint }.to_not raise_error
    end

    it 'equals to https://identitysso.betfair.com/api/certlogin' do
      expect( subject.endpoint ).to eq('https://identitysso.betfair.com/api/certlogin')
    end

    it 'is possible to override' do
      subject.endpoint = 'example'

      expect( subject.endpoint ).to eq('example')
    end
  end

  describe "#headers" do
    it 'returns a Hash with X-Application' do
      expect( subject.http_headers['X-Application'] ).to eq('yMOsRUnms1eEA2I1')
    end
  end

  describe "#request" do
    it 'returns Hash with key :username' do
      expect( subject.request ).to be_has_key(:username)
    end

    it 'returns Hash with key :password' do
      expect( subject.request ).to be_has_key(:password)
    end
  end

  describe "#perform" do
    it 'not raises' do
      expect{ subject.perform }.to_not raise_error
    end

    it 'returns valid response' do
      subject.perform

      expect(subject.http_code).to eq("200")
      expect(subject.http_data["loginStatus"]).to eq("SUCCESS")
      expect(subject.http_data["sessionToken"]).not_to be_nil
      expect(subject.token).to eq(subject.http_data["sessionToken"])
      expect(subject.success?).to be true
    end
  end

end