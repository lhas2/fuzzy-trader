module FiatHelper
    include CryptoHelper

    def fiat_balance(current_price, transactions, format = true)
        response = 0

        CRYPTO_CURRENCIES.each do |crypto|
            balance = crypto_balance(transactions, crypto)
            crypto_price = crypto_current_price(current_price, crypto, false)

            response += balance * crypto_price
        end

        format ? number_to_currency(response) : BigDecimal(response)
    end

    def fiat_invested_balance(current_price, transactions, format = true)
        response = 0

        transactions.each do |transaction|
            response += transaction.fiat_value
        end

        format ? number_to_currency(response) : BigDecimal(response)
    end

    def fiat_variation(current_price, transactions)
        balance = fiat_balance(current_price, transactions, false)
        invested_balance = fiat_invested_balance(current_price, transactions, false)
        variation = ((balance - invested_balance) / invested_balance) * 100
        
        "#{variation.round(2)}%"
    end
end