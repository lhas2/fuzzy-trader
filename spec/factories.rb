FactoryBot.define do
    factory :transaction do
        fiat_currency { "USD" }
        fiat_value { 1000.00 }
        crypto_currency { "BTC" }
        crypto_price { 200.00 }
    end
end