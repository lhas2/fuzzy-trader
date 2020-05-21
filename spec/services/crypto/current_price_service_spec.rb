require 'rails_helper'

RSpec.describe 'Crypto::CurrentPriceService' do
    before(:each) do
        stub_request(:get, "https://api.coincap.io/v2/assets?ids=bitcoin,ethereum,litecoin").to_return(body: '{"data":[{"id":"bitcoin","rank":"1","symbol":"BTC","name":"Bitcoin","supply":"18382543.0000000000000000","maxSupply":"21000000.0000000000000000","marketCapUsd":"164505630999.1510257926117027","volumeUsd24Hr":"9049089399.5403292586789754","priceUsd":"8949.0138007103274989","changePercent24Hr":"-6.0524575875491001","vwap24Hr":"9340.8220508002231724"},{"id":"ethereum","rank":"2","symbol":"ETH","name":"Ethereum","supply":"111021906.8740000000000000","maxSupply":null,"marketCapUsd":"21724784919.1126561867173008","volumeUsd24Hr":"2675953738.5641015113227528","priceUsd":"195.6801637695554700","changePercent24Hr":"-6.7765111875991806","vwap24Hr":"206.1574345740808505"},{"id":"litecoin","rank":"7","symbol":"LTC","name":"Litecoin","supply":"64778355.7265572000000000","maxSupply":"84000000.0000000000000000","marketCapUsd":"2735403095.6502443302463582","volumeUsd24Hr":"226048865.9122296114313548","priceUsd":"42.2271152913628276","changePercent24Hr":"-4.1965884457135322","vwap24Hr":"43.5875133871824871"}],"timestamp":1590086415852}')
    end

    it 'should return a valid response' do
        response = Crypto::CurrentPriceService.execute
        expect(response).to eq([{"id"=>"bitcoin", "rank"=>"1", "symbol"=>"BTC", "name"=>"Bitcoin", "supply"=>"18382543.0000000000000000", "maxSupply"=>"21000000.0000000000000000", "marketCapUsd"=>"164505630999.1510257926117027", "volumeUsd24Hr"=>"9049089399.5403292586789754", "priceUsd"=>"8949.0138007103274989", "changePercent24Hr"=>"-6.0524575875491001", "vwap24Hr"=>"9340.8220508002231724"}, {"id"=>"ethereum", "rank"=>"2", "symbol"=>"ETH", "name"=>"Ethereum", "supply"=>"111021906.8740000000000000", "maxSupply"=>nil, "marketCapUsd"=>"21724784919.1126561867173008", "volumeUsd24Hr"=>"2675953738.5641015113227528", "priceUsd"=>"195.6801637695554700", "changePercent24Hr"=>"-6.7765111875991806", "vwap24Hr"=>"206.1574345740808505"}, {"id"=>"litecoin", "rank"=>"7", "symbol"=>"LTC", "name"=>"Litecoin", "supply"=>"64778355.7265572000000000", "maxSupply"=>"84000000.0000000000000000", "marketCapUsd"=>"2735403095.6502443302463582", "volumeUsd24Hr"=>"226048865.9122296114313548", "priceUsd"=>"42.2271152913628276", "changePercent24Hr"=>"-4.1965884457135322", "vwap24Hr"=>"43.5875133871824871"}])
    end
end
