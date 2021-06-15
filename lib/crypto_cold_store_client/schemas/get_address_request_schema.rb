module CryptoColdStoreClient
  COINS = %w[btc eth]

  class GetAddressRequestSchema < Dry::Validation::Contract

    params do
      required(:coin).filled(:str?, included_in?: COINS)
      required(:code).filled(:str?)
    end

  end
end
