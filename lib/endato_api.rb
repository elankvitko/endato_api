# frozen_string_literal: true

require_relative "endato_api/version"
require_relative "endato_api/client"
require_relative "endato_api/configuration"
require_relative "endato_api/contact/enrichment"

module EndatoApi
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new

      yield configuration
    end

    def api_key
      configuration.api_key
    end

    def api_secret
      configuration.api_secret
    end
  end
end
