class Stock < ApplicationRecord
  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_public_key],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticker)
  end
end
