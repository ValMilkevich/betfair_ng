require 'spec_helper'

describe BetfairNg::API::DataTypes::CancelExecutionReport do
  include SharedHelper::Config

  subject { BetfairNg::API::DataTypes::CancelExecutionReport }

  describe "#class" do
    it "is a Class" do
      expect( subject ).to eq(BetfairNg::API::DataTypes::CancelExecutionReport)
    end
  end

end