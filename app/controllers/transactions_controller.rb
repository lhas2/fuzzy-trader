class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(transaction_params)
        @transaction.crypto_price = "53000.00"
        if @transaction.valid?
            @transaction.save
            redirect_to show_wallet_url, notice: "Your transaction was added."
        else
            render :new
        end
    end
    
    private

    def transaction_params
        params.require(:transaction).permit(:crypto_price, :crypto_currency, :fiat_value, :fiat_currency)
    end
end