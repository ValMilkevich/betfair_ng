require 'spec_helper'

describe BetfairNg do
  include SharedHelper::Config

  subject { BetfairNg }

  describe '#class' do
    it 'is a module' do
      expect(BetfairNg.class).to eq(Module)
    end
  end

  describe "#config" do
    it "stores reference to Config" do
      expect(config).to be_a(BetfairNg::Config)
    end
  end

end