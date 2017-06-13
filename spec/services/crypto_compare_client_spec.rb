require 'rails_helper'

describe CryptoCompareClient do
  let(:json_response) { '{ "Response": "Success", "Type": 100, "Aggregated": true}' }

  let(:crypto_compare_response) { { Response: "Success", Type: 100, "Aggregated": true }.to_json }

  it 'fetches the historic value of bitcoin' do

    stub_request(:get, "https://min-api.cryptocompare.com/data/histoday?aggregate=3&e=CCCAGG&fsym=BTC&limit=60&tsym=USD").
      to_return(:status => 200, :body => json_response, headers: { 'Content-Type' => 'application/json' })

    values = CryptoCompareClient.fetch_bitcoin

    expect(values).to eq crypto_compare_response
  end
end
