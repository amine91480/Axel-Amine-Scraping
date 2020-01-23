require "nokogiri"
require 'open-uri'

crypto_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))