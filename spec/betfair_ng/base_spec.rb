require 'spec_helper'

describe BetfairNg::Base do
  include SharedHelper::Config
  include SharedHelper::Stubs

  subject { BetfairNg::Base.new }

  before do
    stub :certlogin
  end

  describe "#class" do
    it "is a Class" do
      expect( BetfairNg::Base.class ).to eq(Class)
    end
  end

  describe "#session" do
    it "returns newly initialized session" do
      expect( subject.config ).to be_a(BetfairNg::Configuration::Config)
    end

    it "stores config reference" do
      expect( subject.config.to_h ).to eq(config.to_h)
    end

    it "creates a new session" do
      expect( subject.session.create ).to be_a(BetfairNg::Session)
      expect( subject.session.config.token ).to be_a(String)
    end
  end

end