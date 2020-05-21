module Wallets
    class ShowService < ApplicationService
        def initialize
        end

        def execute
            transactions = Transaction.all
            current_price = Crypto::CurrentPriceService.execute

            return { status: :success, transactions: transactions, current_price: current_price }
        end
    end
end