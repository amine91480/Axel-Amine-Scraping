require "nokogiri"
require 'open-uri'

crypto_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def symbol_to_array(doc)
  array = []
  doc.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']//div").each do |symbol| 
    array << symbol.content
  end
  return array
end

def price_to_array(doc)
  array = []
  doc.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']//a").each do |price| 
    price_float = price.content.delete("$").to_f
    array << price_float
  end
  return array
end

def rearrange_hash(hash)
  array = []
  hash.each do |symbol, price|
   mini_hash = { symbol => price }
   array << mini_hash
  end
  return array
end

def perform(page)
  symbol_array = symbol_to_array(page)
  price_array = price_to_array(page)
  big_hash = Hash[symbol_array.zip price_array]
  final_tab = rearrange_hash(big_hash)
  puts final_tab.inspect
end

perform(crypto_page)