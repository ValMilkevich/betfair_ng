require 'spec_helper'

describe BetfairNg::API::Concerns::Configurable do

  include SharedHelper::Config

  let(:klass_blank) {
    (
      Class.new() do
        include BetfairNg::API::Concerns::Cache;
        attr_accessor :config
        def time; Time.now.to_i; end;
        def initialize(params); self.config = params[:config]; end;
      end
    )
  }


  let(:klass) {
    (
      Class.new(BetfairNg::API::Operations::Base::Operation) do
        include BetfairNg::API::Concerns::Cache;
        attr_accessor :config
        def time; Time.now.to_i; end;
      end
    )
  }

  subject{ klass.new(config: config.to_h) }

  let(:no_cache_klass){ klass.new(config: config.to_h.merge(cache: :none)) }

  describe "#with_cache" do

    before do
      subject.cache_storage.try :expire!
    end

    it "raises if not cache_storage defined" do
      obj = Object.new
      expect{klass_blank.new({}).with_cache(obj, 10){}}.to raise_error(NotImplementedError)
    end

    it "stores the request" do
      obj = OpenStruct.new()
      obj2 = OpenStruct.new(data: "YOLO")

      subject.with_cache(obj, 10000){ subject.time }
      expect(subject.cache_storage.size).to eq(1)
      subject.with_cache(obj, 10000){ subject.time }
      expect(subject.cache_storage.size).to eq(1)
      subject.with_cache(obj2, 10000){ subject.time }
      expect(subject.cache_storage.size).to eq(2)
      subject.with_cache(obj2, 10000){ subject.time }
      expect(subject.cache_storage.size).to eq(2)
    end

    it "doesn't store the request for cache: :none" do
      obj = OpenStruct.new()
      obj2 = OpenStruct.new(data: "YOLO")

      obj = OpenStruct.new()
      obj2 = OpenStruct.new(data: "YOLO")
      time = no_cache_klass.with_cache(obj, 10000){ subject.time }
      sleep(1)
      expect(no_cache_klass.with_cache(obj, 10000){ subject.time }).not_to eq(time)
      expect(no_cache_klass.with_cache(obj2, 10000){ subject.time }).not_to eq(time)

    end

    it "hits the cache" do
      obj = OpenStruct.new()
      obj2 = OpenStruct.new(data: "YOLO")
      time = subject.with_cache(obj, 10000){ subject.time }
      sleep(1)
      expect(subject.with_cache(obj, 10000){ subject.time }).to eq(time)
      expect(subject.with_cache(obj2, 10000){ subject.time }).not_to eq(time)
    end
  end

  describe "expire!" do
    before do
      subject.cache_storage.expire!
    end

    it "doesn't expire the valid ones" do
      obj = OpenStruct.new()
      obj2 = OpenStruct.new(data: "YOLO")

      subject.with_cache(obj, 10){ subject.time }
      subject.with_cache(obj2, 10){ subject.time }
      expect(subject.cache_storage.size).to eq(2)
      subject.cache_storage.expire!(10)
      expect(subject.cache_storage.size).to eq(2)
    end

    it "expires the older ones" do
      obj = OpenStruct.new()
      obj2 = OpenStruct.new(data: "YOLO")

      subject.with_cache(obj, 10){ subject.time }
      subject.with_cache(obj2, 10){ subject.time }
      expect(subject.cache_storage.size).to eq(2)
      subject.cache_storage.expire!(0)
      expect(subject.cache_storage.size).to eq(0)
    end
  end

end