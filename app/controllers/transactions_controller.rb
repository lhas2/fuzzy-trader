class TransactionsController < ApplicationController
    def new
        @transaction = Transaction.new
    end

    def create
        response = Transactions::CreateService.execute(transaction_params)

        @transaction = response[:transaction]
        
        return render :new if response[:status] == :error
        redirect_to show_wallet_url, notice: response[:notice]
    end
    
    private

    def transaction_params
        params.require(:transaction).permit(:crypto_price, :crypto_currency, :fiat_value, :fiat_currency)
    end
end