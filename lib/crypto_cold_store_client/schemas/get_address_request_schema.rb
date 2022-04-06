module CryptoColdStoreClient
  COINS = %w[btc eth]

  if not Dry::Validation.const_defined?("Schema")
    class GetAddressRequestSchema < Dry::Validation::Contract

      params do
        required(:coin).filled(:str?, included_in?: COINS)
        required(:code).filled(:str?)
      end

    end
  end
end
