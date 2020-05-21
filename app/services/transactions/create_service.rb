module Transactions
    class CreateService < ApplicationService
        def initialize(params = {})
            @params = params
        end

        def execute
            transaction = Transaction.new(@params)

            return { status: :error, transaction: transaction } unless transaction.valid?

            current_prices = Crypto::CurrentPriceService.execute
            current_price_for_crypto = current_prices.find{|item| item['symbol'] == transaction.crypto_currency}
            
            transaction.crypto_price = BigDecimal(current_price_for_crypto['priceUsd'])

            transaction.save

            return { status: :success, transaction: transaction, notice: "Your transaction was added. 🚀" }
        end
    end
end