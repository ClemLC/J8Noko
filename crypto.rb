PAGE_URL = https://coinmarketcap.com/all/views/all/

def crypto_name (url)
Hash.new { |hash, key| hash[key] = }
  page = Nokogiri::HTML(open(url))
  page.css('.table').each do |element|
    





require 'rubygems'
require 'nokogiri'
require 'open-uri'
