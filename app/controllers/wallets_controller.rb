class WalletsController < ApplicationController
    def show
        @transactions = Transaction.all
        @current_price = Crypto::CurrentPriceService.execute
    end
end