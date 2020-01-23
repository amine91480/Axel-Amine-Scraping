require_relative '../lib/darktrader'

describe "test arrays's sizes" do

	it "test symbols array size" do
		expect(symbol_to_array(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))).size).to eq(200)
	end
		
	it "test symbols array size" do
		expect(price_to_array(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))).size).to eq(200)
	end

end
