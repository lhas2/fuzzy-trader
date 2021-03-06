require 'rails_helper'

RSpec.describe 'Transactions::CreateService' do
    before(:each) do
        allow(Crypto::CurrentPriceService).to receive(:execute).and_return([{"symbol" => "BTC", "priceUsd" => "10000.00"}])
    end

    context 'valid transaction' do
        it 'should return success' do
            params = {
                fiat_currency: 'USD',
                fiat_value: 1000.00,
                crypto_currency: 'BTC'
            }
            response = Transactions::CreateService.execute(params)
            expect(response[:status]).to eq :success
        end
    end

    context 'invalid transaction' do
        it 'should return error' do
            params = {
                fiat_currency: 'USD',
                crypto_currency: 'BTC'
            }
            response = Transactions::CreateService.execute(params)
            expect(response[:status]).to eq :error
        end
    end
end