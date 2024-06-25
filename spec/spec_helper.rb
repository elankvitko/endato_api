# frozen_string_literal: true

require "endato_api"
require "webmock/rspec"
require "pry"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    EndatoApi.configure do |config|
      config.api_key = "test_api_key"
      config.api_secret = "test_api_secret"
    end
  end
end

RSpec::Expectations.configuration.on_potential_false_positives = :nothing
