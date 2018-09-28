require "spec_helper"

RSpec.describe "Getting a Deposit Address", vcr: { record: :once } do
  context "valid coin" do
    it "creates a deposit request" do
      client = CryptoColdStoreClient.new(host: ENV["CRYPTO_COLD_STORE_HOST"])

      response = client.get_address(
        coin: "btc",
        code: "TEST-ID",
      )

      expect(response).to be_success
      expect(response.address).to be_present
      expect(response.min).to be_present
    end
  end

  context "invalid coin" do
    it "raises an error" do
      client = CryptoColdStoreClient.new(host: ENV["CRYPTO_COLD_STORE_HOST"])

      expect {
        client.get_address(coin: "xlm", code: "TEST-ID")
      }.to raise_error(ArgumentError)
    end
  end
end

