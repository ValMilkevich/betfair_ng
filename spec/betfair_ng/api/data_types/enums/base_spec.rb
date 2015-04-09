require 'spec_helper'

describe BetfairNg::API::DataTypes::Enums::Base do
  include SharedHelper::Config

  subject{ Class.new(BetfairNg::API::DataTypes::Enums::Base){ def self.values; ['STRING', :SYMBOL] end} }

  describe "#class" do
    it "is a Class" do
      expect( subject.class ).to eq(Class)
    end
  end

  describe ".initialize" do
    it "raises if not supported" do
      expect{ subject.new( data: 'abr') }.to raise_error(ArgumentError)
    end

    it "utilizes both string and symbol" do
      expect{ subject.new( data: 'STRING') }.not_to raise_error
      expect{ subject.new( data: :STRING) }.not_to raise_error

      expect{ subject.new( data: 'SYMBOL') }.not_to raise_error
      expect{ subject.new( data: :SYMBOL) }.not_to raise_error

      expect{ subject.new( 'SYMBOL') }.not_to raise_error
      expect{ subject.new( :SYMBOL) }.not_to raise_error

      expect{ subject.new( nil, default: true ) }.not_to raise_error
      expect{ subject.new( {}, default: true ) }.not_to raise_error
      expect{ subject.new( [], default: true ) }.not_to raise_error
    end

    it "returns value if default" do
      expect( subject.new( data: nil, default: true).serialize ).to eq('STRING')
      expect( subject.new( data: 'SYMBOL', default: true).serialize ).to eq('SYMBOL')

      expect( subject.new( nil, default: true).serialize ).to eq('STRING')
      expect( subject.new( 'SYMBOL', default: true).serialize ).to eq('SYMBOL')
    end

    it "initializes in both formats" do
      expect( subject.new( data: nil, default: true).serialize ).to eq('STRING')
      expect( subject.new( nil, default: true).serialize ).to eq('STRING')

      expect( subject.new( data: 'SYMBOL', ).serialize ).to eq('SYMBOL')
      expect( subject.new( 'SYMBOL' ).serialize ).to eq('SYMBOL')

      expect( subject.new( nil, default: :SYMBOL).data ).to eq('SYMBOL')
    end
  end

  describe "#serialize" do
    it "correctly presents a hash" do
      expect( subject.new( data: 'STRING').serialize ).to eq('STRING')
      expect( subject.new( data: :STRING).serialize ).to eq('STRING')
    end
  end

  describe "#to_json" do
    it "presents correct json" do
      expect( subject.new( data: :STRING).to_json ).to eq('STRING')
    end
  end

  describe "#data" do
    it "correctly responds with stored value" do
      expect( subject.new( data: :STRING).data ).to eq('STRING')

      expect( subject.new( :STRING).data ).to eq('STRING')

      expect( subject.new( nil, default: true).data ).to eq('STRING')
    end
  end

  describe ".default" do
    it "returns first value of the values" do
      expect(subject.default).to eq('STRING')
    end
  end

end