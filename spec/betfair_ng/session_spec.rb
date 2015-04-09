require 'spec_helper'

describe BetfairNg::Session do
  include SharedHelper::Config
  include SharedHelper::Stubs

  subject { session }

  before do
    stub :certlogin
    stub :keep_alive
    stub :logout
    stub :fail_logout
  end

  describe "#class" do
    it "is a Class" do
      expect( BetfairNg::Session.class ).to eq(Class)
    end
  end

  describe "#config" do
    it "creates a new config reference" do
      expect( subject.config.object_id ).not_to eq(config.object_id)
      expect( subject.config.to_h ).to eq(config.to_h)
    end
  end

  describe "#create" do
    it "returns newly created session" do
      expect( subject.config.token ).to be_a(String)
    end

    it "updates #updated_at" do
      expect( subject.create ).to be_a(BetfairNg::Session)
      expect( subject.updated_at - Time.now ).to be < 1
    end
  end

  describe "#keep_alive" do
    it "returns newly created session" do
      expect( subject.keep_alive ).to be_a(String)
    end

    it "updates #updated_at" do
      expect( subject.keep_alive ).to be_a(String)
      expect( subject.updated_at - Time.now ).to be < 1
    end
  end

  describe "#logout" do
    it "deletes session token" do
      subject.create
      expect( subject.logout ).to eq(nil)
      expect( subject.config.token ).to eq(nil)
    end

    it "updates #updated_at" do
      subject.create
      expect( subject.logout ).to eq(nil)
      expect( subject.config.token ).to eq(nil)
      expect( subject.updated_at - Time.now ).to be < 1
    end

    it "fails to logout when not logged in" do
      config.token = nil
      subject = BetfairNg::Session.new( config: config )
      expect( subject.logout ).to eq(nil)
      expect( subject.operation.success? ).to eq(false)
      expect( subject.operation.http_data["error"]).to eq("INPUT_VALIDATION_ERROR")
    end

  end

end