module Crypto
    class CurrentPriceService < ApplicationService
        def initialize(crypto = 'BTC')
            @crypto = 'BTC'
        end
        def execute
            response = Faraday.get 'https://api.coincap.io/v2/assets?ids=bitcoin,ethereum,litecoin'
            body_as_json = JSON.parse(response.body)

            body_as_json['data']
        end
    end
end