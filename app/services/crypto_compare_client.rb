class CryptoCompareClient
  include HTTParty
  base_uri 'https://min-api.cryptocompare.com/data/histoday'
  format :json

  def self.fetch_bitcoin
    response = get("?fsym=BTC&tsym=USD&limit=60&aggregate=3&e=CCCAGG")
    if response.success?
      return response.to_json
    else
      raise response.error
    end
  end

end
