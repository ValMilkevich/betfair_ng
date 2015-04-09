require 'spec_helper'

describe BetfairNg::API::DataTypes::Base do
  include SharedHelper::Config

  let(:klass){ Class.new(BetfairNg::API::DataTypes::Base){ field :event_type, type: String; field :abr_abr, type: Array} }
  let(:attrs){ { eventType: 'asdf', abr_abr: ['123', 123] } }
  subject { BetfairNg::API::DataTypes::Base }

  describe "#class" do
    it "is a Class" do
      expect( klass.class ).to eq(Class)
    end
  end

  describe "#serialize" do
    it "correctly presents a hash" do
      expect( klass.new(attrs).serialize ).to eq({event_type: 'asdf', abr_abr: ['123', 123]})
    end
  end

  describe "#to_json" do
    it "presents correct json" do
      expect( klass.new(attrs).to_json ).to eq({eventType: 'asdf', abrAbr: ['123', 123]}.to_json)
    end
  end

  describe "#class" do
    it "is a Class" do
      expect( subject.class ).to eq(Class)
    end
  end

end