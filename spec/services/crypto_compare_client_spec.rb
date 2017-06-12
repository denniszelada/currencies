require 'rails_helper'

describe CryptoCompareClient do
  it 'fetches the historic value of bitcoin' do
    stub_request(:get, '').with({}.to_json)

    values = CryptoCompareClient.fetch_bitcoin

    expect(values.response).to eq 'Success'
  end
end
