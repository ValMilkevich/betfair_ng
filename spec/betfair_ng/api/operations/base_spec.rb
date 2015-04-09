require 'spec_helper'

context BetfairNg::API::Operations::Base do
  include SharedHelper::Config
  include SharedHelper::Stubs

  describe BetfairNg::API::Operations::Base::Operation do
    subject { BetfairNg::API::Operations::Base::Operation }

    describe "Operation, HTTP" do
      it "contains proper modules" do
        expect(subject.ancestors).to be_include(BetfairNg::API::Concerns::Configurable)
        expect(subject.ancestors).to be_include(BetfairNg::API::Concerns::HTTP)
      end
    end

    describe "#initialize" do
      it "works without config" do
        expect{subject.new({})}.not_to raise_error
      end
    end
  end

  describe BetfairNg::API::Operations::Base::Response do
    subject { BetfairNg::API::Operations::Base::Response }

    describe "Field, Serialization, ::OpenStruct" do
      it "contains proper modules" do
        expect(subject.ancestors).to be_include(BetfairNg::API::Concerns::Field)
        expect(subject.ancestors).to be_include(BetfairNg::API::Concerns::Serialization)
        expect(subject.ancestors).to be_include(OpenStruct)
      end
    end

    describe ".fields" do
      it "contains error field" do
        expect(subject.fields.keys).to be_include(:error)
      end
    end
  end

  describe BetfairNg::API::Operations::Base::Request do
    subject { BetfairNg::API::Operations::Base::Request }

    describe "Field, Serialization, ::OpenStruct" do
      it "contains proper modules" do
        expect(subject.ancestors).to be_include(BetfairNg::API::Concerns::Field)
        expect(subject.ancestors).to be_include(BetfairNg::API::Concerns::Serialization)
        expect(subject.ancestors).to be_include(OpenStruct)
      end
    end
  end

end