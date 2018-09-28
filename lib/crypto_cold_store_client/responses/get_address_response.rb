module CryptoColdStoreClient
  class GetAddressResponse

    include APIClientBase::Response.module

    BODY_ATTRS = %i[
      address
      min
    ].freeze

    attribute(:body, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :address, String, lazy: true, default: :default_address
    attribute :min, BigDecimal, lazy: true, default: :default_min

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    BODY_ATTRS.each do |attr|
      define_method("default_#{attr}".to_sym) do
        body[attr]
      end
    end

  end
end

