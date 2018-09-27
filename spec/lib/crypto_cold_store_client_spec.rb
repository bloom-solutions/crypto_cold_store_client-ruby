require "spec_helper"

RSpec.describe CryptoColdStoreClient do
  it "has a version number" do
    expect(CryptoColdStoreClient::VERSION).not_to be nil
  end
end
