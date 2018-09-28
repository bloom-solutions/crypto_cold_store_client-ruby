module CryptoColdStoreClient
  COINS = %w[btc eth]

  GetAddressRequestSchema = Dry::Validation.Schema do
    required(:coin).filled(:str?, included_in?: COINS)
    required(:code).filled(:str?)
  end
end
