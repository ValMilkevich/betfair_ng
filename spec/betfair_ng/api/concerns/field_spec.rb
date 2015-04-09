require 'spec_helper'

describe BetfairNg::API::Concerns::Field do

  subject { Class.new(BetfairNg::API::DataTypes::Base){ include BetfairNg::API::Concerns::Field }}

  let(:response_body) {OpenStruct.new(MultiJson.load("{\"jsonrpc\":\"2.0\",\"result\":[{\"eventType\":{\"id\":\"468328\",\"name\":\"Handball\"},\"marketCount\":22}]}"))}

  let(:class_with_name) { Class.new(BetfairNg::API::DataTypes::Base){ include BetfairNg::API::Concerns::Field; field :name } }

  describe "#class" do
    it "is a Class" do
      expect( BetfairNg::API::Concerns::Field.class ).to eq(Module)
    end
  end

  describe "included" do
    it "properly includes" do
      expect{subject}.not_to raise_error
    end
  end

  describe ".help" do
    it "shows 1 level help" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct }
      expect(klass.help).to eq({:name=>{}, :event_type=>{:type=>OpenStruct}})
    end

    it "shows N level help" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: BetfairNg::API::Operations::Betting::ListEvents::Response, required: true }
      expect(klass.help).to eq({:name=>{}, :event_type=>{:type=>{:error=>{:type=>{:code=>{:type=>String, :required=>true}, :message=>{:type=>String}, :data=>{:type=>OpenStruct}}}, :result=>{:type=>BetfairNg::API::DataTypes::List, :of=>{:event=>{:type=>{:id=>{:type=>String, :required=>false}, :name=>{:type=>String, :required=>false}, :country_code=>{:type=>String, :required=>false}, :timezone=>{:type=>String, :required=>false}, :venue=>{:type=>String, :required=>false}, :open_date=>{:type=>Date, :required=>false}}, :required=>false}, :market_count=>{:type=>Fixnum, :required=>false}}}}, :required=>true}})
    end
  end

  describe ".fields" do
    it "adds class method" do
      expect(subject.respond_to?(:fields)).to be true
      expect(subject.respond_to?(:instance_fields)).to be true
      expect(subject.respond_to?(:instance_fields=)).to be true
    end

    it "initializes with []" do
      expect(subject.fields).to eq({})
    end

    it "returns current classes fields" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct }
      expect(klass.fields).to eq({name: {}, event_type: {type: OpenStruct}})
    end

    it "shows inherited fields" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct }
      klass2 = Class.new(klass){ include BetfairNg::API::Concerns::Field; field :result; field :value, type: OpenStruct }

      expect(klass2.fields).to eq({name: {}, event_type: {type: OpenStruct}, result: {}, value: {type: OpenStruct}} )
    end

    it "overloads inherited fields" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct }
      klass2 = Class.new(klass){ include BetfairNg::API::Concerns::Field; field :name, type: String; field :value, type: OpenStruct }

      expect(klass2.fields).to eq({name: {type: String}, event_type: {type: OpenStruct}, value: {type: OpenStruct}} )
    end
  end

  describe "#initialize" do
    it "not raises when nil provided" do
      expect{subject.new(nil)}.not_to raise_error
      expect{subject.new()}.not_to raise_error
      expect{subject.new([])}.not_to raise_error
      expect{subject.new({})}.not_to raise_error
    end

    it "properly sets blank {} values" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct }
      expect(klass.new(event_type: {}).event_type).to eq(OpenStruct.new({}))
    end

    it "properly sets blank [] values" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: Array }
      expect(klass.new(event_type: []).event_type).to eq([])
    end
  end

  describe ".field" do
    it "adds a field to class methods" do
      expect(subject.respond_to?(:field)).to be true
      expect(subject.respond_to?(:field=)).to be false
    end

    it "ads a field to fields" do
      expect(class_with_name.fields).to eq(name: {})
    end

    it "works with real classes" do
      expect(BetfairNg::API::DataTypes::EventTypeResult.fields.keys).to eq( [:event_type, :market_count] )
    end

    it "correctly set the nested type" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct }
      expect(klass.new(response_body.result.first).event_type).to be_a(OpenStruct)
    end

    it "returns default if nil" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct, default: 'HELLO' }
      expect(klass.new().event_type).to eq('HELLO')
    end

    it "processes default Proc value" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: OpenStruct, default: Proc.new(){'HELLO'} }
      expect(klass.new().event_type).to eq('HELLO')
    end

    it "raises if not valid klass" do
      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: "Float" }
      expect{ klass.new(response_body.result.first).event_type }.to raise_error(NoMethodError)

      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: "Integer" }
      expect{ klass.new(response_body.result.first).event_type }.to raise_error(NotImplementedError)

      klass = Class.new(OpenStruct){ include BetfairNg::API::Concerns::Field; field :name; field :event_type, type: "Bogus" }
      expect{ klass.new(response_body.result.first).event_type }.to raise_error(NameError)
    end
  end

  describe "#to_json" do
    it "correctly transforms nested" do
      expect(class_with_name.new(response_body.result.first).to_json).to eq("{\"eventType\":{\"id\":\"468328\",\"name\":\"Handball\"},\"marketCount\":22}")
    end
  end

  describe "#cast_value" do

    it ":String" do
      expect( subject.cast_value(response_body.result, type: String) ).to eq(response_body.result.to_s)
      expect( subject.cast_value(response_body.result, type: "String") ).to eq(response_body.result.to_s)
      expect( subject.cast_value(response_body.result, type: :String) ).to eq(response_body.result.to_s)
    end
    it ":Date" do
      expect( subject.cast_value("2013-12-22", type: Date) ).to eq(Time.parse('2013-12-22').to_date)
    end

    it ":Time" do
      expect( subject.cast_value("2013-12-22", type: Time) ).to eq(Time.parse('2013-12-22'))
    end

    it ":Fixnum" do
      expect( subject.cast_value("2013-12-22", type: Fixnum) ).to eq(2013)
    end

    it ":Float" do
      expect( subject.cast_value("2013", type: Float) ).to eq(2013.0)
      expect( subject.cast_value("2013.123", type: Float) ).to eq(2013.123)
    end

    it ":Boolean" do
      expect( subject.cast_value("true", type: BetfairNg::API::DataTypes::Boolean) ).to eq(true)
      expect( subject.cast_value("false", type: BetfairNg::API::DataTypes::Boolean) ).to eq(false)
    end

    it ":List" do
      expect( subject.cast_value(["2013", 123], type: BetfairNg::API::DataTypes::List, of: String) ).to eq(["2013", "123"])
      expect( subject.cast_value(["2013", 123], type: BetfairNg::API::DataTypes::List, of: Fixnum) ).to eq([2013, 123])
    end

    it ":Set" do
      expect( subject.cast_value(["2013", 123], type: BetfairNg::API::DataTypes::Set, of: String) ).to eq(["2013", "123"])
      expect( subject.cast_value(["2013", 123], type: BetfairNg::API::DataTypes::Set, of: Fixnum) ).to eq([2013, 123])
    end

    it ":Map" do
      expect( subject.cast_value(["2013", 123], type: BetfairNg::API::DataTypes::Map, of: [Fixnum, String]) ).to eq([2013, "123"])
      expect( subject.cast_value(["2013", 123], type: BetfairNg::API::DataTypes::Map, of: [Fixnum, Float]) ).to eq([2013, 123.0])
    end

    it OpenStruct do
      expect( subject.cast_value({asdf: 123}, type: OpenStruct) ).to be_instance_of(OpenStruct)
      expect( subject.cast_value({asdf: 123}, type: OpenStruct).asdf ).to eq(123)
    end
  end

end