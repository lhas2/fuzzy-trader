class WalletsController < ApplicationController
    def show
        @transactions = Transaction.all
    end
end