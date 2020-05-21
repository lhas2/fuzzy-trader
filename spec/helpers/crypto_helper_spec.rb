require 'rails_helper'

RSpec.describe 'CryptoHelper' do
    include CryptoHelper
    describe 'crypto_balance(transactions, crypto)' do
        it 'should return the correct balance for the desired crypto' do
            create(:transaction)
            create(:transaction, crypto_currency: 'LTC')
            create(:transaction, crypto_currency: 'ETH')

            transactions = Transaction.all
            crypto = 'BTC'
            response = crypto_balance(transactions, crypto)

            expect(response.to_s('F')).to eq('5.0') 
        end
    end

    describe 'crypto_current_price(current_price, crypto, format)' do
        it 'should return the correct price for the desired crypto' do
            current_price = [
                {
                    "symbol" => "BTC",
                    "priceUsd" => "10000.00"
                }
            ]
            crypto = 'BTC'
            response = crypto_current_price(current_price, crypto)
            response_without_format = crypto_current_price(current_price, crypto, false)

            expect(response).to eq('$10,000.00') 
            expect(response_without_format.to_s('F')).to eq('10000.0') 
        end
    end
end
