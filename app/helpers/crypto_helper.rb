module CryptoHelper
    def crypto_balance(transactions, crypto)
        balance = transactions
            .select{|item| item.crypto_currency === crypto}
            .reduce(0) {|sum, item| sum + (item.fiat_value / item.crypto_price)}

        balance.round(8)
    end

    def crypto_current_price(current_price, crypto, format = true)
        response = current_price.find{|item| item['symbol'] == crypto}

        format ? number_to_currency(response['priceUsd']) : BigDecimal(response['priceUsd'])
    end
end