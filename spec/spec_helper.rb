require "bundler/setup"

require "dotenv"

ENV_FILES = %w[.env.test.local .env]
Dotenv.load(*ENV_FILES)

require "active_support/core_ext/hash/indifferent_access"
require "active_support/json"
require "pathname"
require "vcr"
require "pry-byebug"
require "crypto_cold_store_client"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |c|
  FILTERED_VARIABLES = %w[CRYPTO_COLD_STORE_HOST]

  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  FILTERED_VARIABLES.each do |var|
    c.filter_sensitive_data("[#{var}]") { ENV[var] }
  end
end
