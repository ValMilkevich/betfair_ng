require 'spec_helper'

describe BetfairNg::API::Operations::Betting::Navigation::Operation do
  include SharedHelper::Config
  include SharedHelper::Stubs

  before do
    stub :certlogin
    stub :navigation
  end

  subject { BetfairNg::API::Operations::Betting::Navigation::Operation.new( config: config, session: session ) }

  describe '#endpoint' do

    it 'should not raise' do
      expect{ subject.endpoint }.to_not raise_error
    end

    it 'is correct' do
      expect( subject.endpoint ).to eq('https://api.betfair.com/exchange/betting/rest/v1/en/navigation/menu.json')
    end

    it 'is possible to override' do
      subject.config.locale = 'de'
      expect( subject.endpoint ).to eq('https://api.betfair.com/exchange/betting/rest/v1/de/navigation/menu.json')
      subject.config.locale = 'en'
    end
  end

  describe "#headers" do
    it 'doesn\'t change a Hash with X-Application after initialization' do
      session.config.token = 'ADSFASDFASDFSDF'
      expect( subject.http_headers['X-Application'] ).to eq('j88ytx4Agw6DFX5k')
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
      session.create
    end

    it 'not raises' do
      expect{ subject.perform }.to_not raise_error
    end

    it 'returns valid response' do
      subject.perform

      expect(subject.http_code).to eq("200")
      expect(subject.success?).to be true
      expect(subject.http_data["children"]).not_to be_blank
      expect(subject.http_data.id).to eq(0)
      expect(subject.http_data.name).to eq("ROOT")
      expect(subject.http_data.type).to eq("GROUP")
    end
  end

end