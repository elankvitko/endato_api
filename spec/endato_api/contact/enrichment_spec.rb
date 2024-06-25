# frozen_string_literal: true

RSpec.describe EndatoApi::Contact::Enrichment do
  describe "#initialize" do
    subject { described_class.new }

    it "initializes with correct endpoint" do
      expect(subject.instance_variable_get(:@endpoint)).to eq("contact/enrich")
    end
  end

  describe "#fetch_contact_enrichment" do
    let(:enrichment_client) { described_class.new }
    let(:params) do
      {
        first_name: "Elan",
        last_name: "Kvitko",
        street: "2940 West 5th St.",
        city: "Brooklyn",
        state: "NY"
      }
    end

    let(:expected_payload) do
      {
        "FirstName": "Elan",
        "LastName": "Kvitko",
        "Address": {
          "AddressLine1": "2940 West 5th St.",
          "AddressLine2": "Brooklyn, NY"
        }
      }
    end

    it "calls fetch_data with correct payload" do
      allow(enrichment_client).to receive(:fetch_data).and_return({ "enriched_data": "mocked_data" })

      response = enrichment_client.fetch_contact_enrichment(params)

      expect(response).to eq({ "enriched_data": "mocked_data" })
      expect(enrichment_client).to have_received(:fetch_data).with(expected_payload)
    end
  end

  describe ".headers" do
    subject { described_class.new.send(:headers) }

    it "returns headers with galaxy_search_type" do
      expect(subject).to have_key(:galaxy_search_type)
    end
  end
end
