require 'rails_helper'

describe CryptoCompareClient do
  it 'fetches the historic value of bitcoin' do
    stub_request(:get, 'https://min-api.cryptocompare.com/data/histoday').
      with(body: {fsym:'BTC', tsym:'USD', limit:'60', aggregate:'3', e:'CCCAGG'}.to_json)

    values = CryptoCompareClient.fetch_bitcoin

    expect(values.response).to eq 'Success'
  end
end
