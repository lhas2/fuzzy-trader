require 'rails_helper'

RSpec.describe 'Wallets::ShowService' do
    before(:each) do
        allow(Crypto::CurrentPriceService).to receive(:execute).and_return([{"symbol" => "BTC", "priceUsd" => "10000.00"}])
    end

    it 'should return a valid response' do
        response = Wallets::ShowService.execute
        expect(response[:status]).to eq :success
        expect(response[:current_price]).to eq([{"symbol" => "BTC", "priceUsd" => "10000.00"}])
    end
end