class WalletsController < ApplicationController
    def show
        response = Wallets::ShowService.execute

        @transactions = response[:transactions]
        @current_price = response[:current_price]
    end
end