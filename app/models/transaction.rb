class Transaction < ApplicationRecord
    validates :fiat_currency, presence: true
    validates :fiat_value, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
    validates :crypto_currency, presence: true
end