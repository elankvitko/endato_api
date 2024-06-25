require "pry"

module EndatoApi
  module Contact
    class Enrichment < EndatoApi::Client
      def initialize
        super("contact/enrich")
      end

      def fetch_contact_enrichment(params)
        payload = {
          "FirstName": params[:first_name],
          "LastName": params[:last_name],
          "Address": {
            "AddressLine1": params[:street],
            "AddressLine2": "#{params[:city]}, #{params[:state]}"
          }
        }

        fetch_data(payload)
      end

      private

      def headers
        super.merge(galaxy_search_type: "DevAPIContactEnrich")
      end
    end
  end
end
