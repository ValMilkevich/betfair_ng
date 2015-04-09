require 'spec_helper'

describe BetfairNg::API::DataTypes::MarketFilter do
  include SharedHelper::Config

  subject { BetfairNg::API::DataTypes::MarketFilter }

  describe "#class" do
    it "is a Class" do
      expect( subject ).to eq(BetfairNg::API::DataTypes::MarketFilter)
    end
  end

  describe "#inititalize" do
    it "assigns attributes" do
      obj = subject.new( event_ids: [1, 2, 3])
      expect(obj.event_ids).to eq(["1", "2", "3"])
    end
  end

  describe "#to_json" do
    it "returns proper hash" do
      obj = subject.new( event_ids: [1, 2, 3])
      expect(obj.to_json).to eq({eventIds: ["1", "2", "3"]}.to_json)
    end
  end

end