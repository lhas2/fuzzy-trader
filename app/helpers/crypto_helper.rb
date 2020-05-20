module CryptoHelper
    def crypto_balance(transactions, crypto)
        balance = transactions
            .select{|item| item.crypto_currency === crypto}
            .reduce(0) {|sum, item| sum + (item.fiat_value / item.crypto_price)}

        balance.round(8)
    end

    def crypto_current_price(crypto)
        return number_to_currency(9500) if crypto == "BTC"
        return number_to_currency(210) if crypto == "ETH"
        return number_to_currency(44) if crypto == "LTC"
    end
end