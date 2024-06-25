# frozen_string_literal: true

RSpec.describe EndatoApi::Client do
  let(:endpoint) { "some_endpoint" }
  let(:client) { described_class.new(endpoint) }

  describe "#initialize" do
    it "initializes with an endpoint and retrieves api_key and api_secret" do
      expect(client.api_key).to eq("test_api_key")
      expect(client.api_secret).to eq("test_api_secret")
      expect(client.endpoint).to eq(endpoint)
    end
  end

  describe "#fetch_data" do
    context "when API request is successful" do
      it "returns parsed response" do
        stub_request(:post, "https://devapi.endato.com/some_endpoint")
          .with(headers: { content_type: "application/json", api_key: client.api_key, api_secret: client.api_secret })
          .to_return(status: 200, body: '{"data": "test_data"}')

        response = client.fetch_data("some_endpoint")
        expect(response).to eq({ "data" => "test_data" })
      end
    end

    context "when API request fails" do
      let(:endpoint) { "invalid_endpoint" }

      it "raises an error" do
        stub_request(:get, "https://devapi.endato.com/invalid_endpoint")
          .with(headers: { content_type: "application/json", api_key: client.api_key, api_secret: client.api_secret })
          .to_return(status: 404)

        expect { client.fetch_data("meow") }.to raise_error
      end
    end
  end
end
