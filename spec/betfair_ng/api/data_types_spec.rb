require 'spec_helper'

describe BetfairNg::API::DataTypes do
  subject { BetfairNg::API::DataTypes }

  describe '#class' do

    it 'is a Module' do
      expect(subject.class).to eq(Module)
    end
  end
end