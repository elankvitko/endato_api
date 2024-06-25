# frozen_string_literal: true

RSpec.describe EndatoApi do
  describe ".configure" do
    subject do
      EndatoApi.configure do |config|
        config.api_key = "test_api_key_1"
        config.api_secret = "test_api_secret_1"
      end
    end

    it "yields configuration" do
      subject

      expect(EndatoApi.api_key).to eq("test_api_key_1")
      expect(EndatoApi.api_secret).to eq("test_api_secret_1")
    end
  end
end
