module EndatoApi
  class Configuration
    attr_accessor :api_key
    attr_accessor :api_secret

    def initialize
      @api_key = nil
      @api_secret = nil
    end
  end
end
