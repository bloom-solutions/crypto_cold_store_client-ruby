module CryptoColdStoreClient
  class GetAddressRequest

    include APIClientBase::Request.module

    BODY_ATTRS = %i[
      coin
      code
    ]
    attribute :coin, String
    attribute :code, String

    private

    def path
      "/api/v1/deposit_detail"
    end

    def params
      BODY_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end

