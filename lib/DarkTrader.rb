require 'nokogiri'
require 'open-uri'

cryptopage = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

symbols = cryptopage.xpath('//td[contains(@class, "by__symbol")]').map(&:text)
prices = cryptopage.xpath('//td[contains(@class, "by__price")]').map(&:text)

hash_symbols_to_prices = Hash[symbols.zip(prices)]
hash_symbols_to_prices.each {|k,v| puts "#{k} : #{v}"}