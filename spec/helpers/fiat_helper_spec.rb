require 'rails_helper'

RSpec.describe 'FiatHelper' do
    include FiatHelper

    describe 'fiat_balance(current_price, transactions, format)' do
        it 'should return the fiat balance for all transactions' do
            create(:transaction)
            create(:transaction, crypto_currency: "LTC")
            transactions = Transaction.all
            current_price = [{"symbol" => "BTC", "priceUsd" => "10000.00"}, {"symbol" => "LTC", "priceUsd" => "200.00"}]
            response = fiat_balance(current_price, transactions)
            response_without_format = fiat_balance(current_price, transactions, false)
            expect(response).to eq("$51,000.00")
            expect(response_without_format.to_s("F")).to eq("51000.0")
        end
    end

    describe 'fiat_invested_balance(current_price, transactions, format)' do
        it 'should return the total invested balance for all transactions' do
            create(:transaction)
            create(:transaction, crypto_currency: "LTC")
            transactions = Transaction.all
            current_price = [{"symbol" => "BTC", "priceUsd" => "10000.00"}, {"symbol" => "LTC", "priceUsd" => "200.00"}]
            response = fiat_invested_balance(current_price, transactions)
            response_without_format = fiat_invested_balance(current_price, transactions, false)
            expect(response).to eq("$2,000.00")
            expect(response_without_format.to_s("F")).to eq("2000.0")
        end
    end

    describe 'fiat_variation(current_price, transactions)' do
        it 'should return the variation percentage' do
            create(:transaction, crypto_price: 9500)
            create(:transaction, crypto_price: 190, crypto_currency: "LTC")
            transactions = Transaction.all
            current_price = [{"symbol" => "BTC", "priceUsd" => "10000.00"}, {"symbol" => "LTC", "priceUsd" => "200.00"}]
            response = fiat_variation(current_price, transactions)
            expect(response).to eq("5.26%")
        end
    end
end
