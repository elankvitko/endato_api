# frozen_string_literal: true

RSpec.describe EndatoApi::Configuration do
  describe "#initialize" do
    it "initializes with nil values" do
      config = EndatoApi::Configuration.new

      expect(config.api_key).to be_nil
      expect(config.api_secret).to be_nil
    end
  end

  describe "accessors" do
    let(:config) { EndatoApi::Configuration.new }
    let(:test_api_key) { "test_api_key" }
    let(:test_api_secret) { "test_api_secret" }

    it "sets and retrieves api_key" do
      config.api_key = test_api_key

      expect(config.api_key).to eq(test_api_key)
    end

    it "sets and retrieves api_secret" do
      config.api_secret = test_api_secret
      expect(config.api_secret).to eq(test_api_secret)
    end
  end
end
