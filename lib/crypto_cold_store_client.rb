require "active_support/core_ext/hash/indifferent_access"
require "api_client_base"
require "dry-validation"
require "gem_config"
require "crypto_cold_store_client/version"

module CryptoColdStoreClient

  include APIClientBase::Base

  with_configuration do
    has :host, classes: String
  end

end

require "crypto_cold_store_client/client"
require "crypto_cold_store_client/coercers/indifferent_hash"
require "crypto_cold_store_client/requests/get_address_request"
require "crypto_cold_store_client/responses/get_address_response"
require "crypto_cold_store_client/schemas/get_address_request_schema"
