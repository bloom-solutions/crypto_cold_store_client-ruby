module CryptoColdStoreClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :get_address

    private

    def default_opts
      { host: host }
    end

  end
end

