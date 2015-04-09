require 'spec_helper'

describe BetfairNg::API do
  subject { BetfairNg::API }

  describe '#class' do

    it 'is a Module' do
      expect(subject.class).to eq(Module)
    end
  end
end