class BitcoinController < ApplicationController
  def index
    begin
      bitcoins_values = CryptoCompareClient.fetch_bitcoin
      @bitcoins = bitcoins_values['Data'].map { |value| [value['time'], value['close']]}
    rescue
      flash[:notice] = "No values found"
      return 'No values found'
    end
  end
end
