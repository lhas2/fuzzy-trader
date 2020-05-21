require 'rails_helper'

RSpec.describe 'Wallets::ShowService' do
    before(:each) do
        allow(Crypto::CurrentPriceService).to receive(:execute).and_return([{"symbol" => "BTC", "priceUsd" => "10000.00"}])
    end

    it 'should return all transactions' do
        response = Wallets::ShowService.execute
        expect(response[:status]).to eq :success
    end
end