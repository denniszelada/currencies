class BitcoinController < ApplicationController
  def index
    @bitcoin = CryptoCompareClient.fetch_bitcoin
  end
end
