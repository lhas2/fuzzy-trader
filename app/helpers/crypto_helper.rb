module CryptoHelper
    def crypto_balance(transactions, crypto)
        balance = transactions
            .select{|item| item.crypto_currency === crypto}
            .reduce(0) {|sum, item| sum + (item.fiat_value / item.crypto_price)}

        balance.round(8)
    end
end