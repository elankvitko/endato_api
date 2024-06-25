# frozen_string_literal: true

require "rest-client"

class EndatoApi::Client
  BASE_URL = "https://devapi.endato.com"

  attr_reader :endpoint, :api_key, :api_secret

  def initialize(endpoint)
    @endpoint = endpoint
    @api_key = EndatoApi.api_key
    @api_secret = EndatoApi.api_secret
  end

  def fetch_data(payload = {})
    url = "#{BASE_URL}/#{endpoint}"
    response = RestClient.post(url, payload, headers)

    handle_response(response)
  rescue RestClient::ExceptionWithResponse => e
    handle_error(e.response)
  end

  private

  def headers
    {
      content_type: "application/json",
      galaxy_ap_name: api_key,
      galaxy_ap_password: api_secret
    }
  end

  def handle_response(response)
    JSON.parse(response.body)
  end

  def handle_error(response)
    # Handle error responses
    nil
  end
end
