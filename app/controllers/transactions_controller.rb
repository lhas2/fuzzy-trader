class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(transaction_params)
        @current_price = Crypto::CurrentPriceService.execute
        @crypto_price = @current_price.find{|item| item['symbol'] == @transaction.crypto_currency}
        @transaction.crypto_price = BigDecimal(@crypto_price['priceUsd'])
        if @transaction.valid?
            @transaction.save
            redirect_to show_wallet_url, notice: "Your transaction was added. 🚀"
        else
            render :new
        end
    end
    
    private

    def transaction_params
        params.require(:transaction).permit(:crypto_price, :crypto_currency, :fiat_value, :fiat_currency)
    end
end