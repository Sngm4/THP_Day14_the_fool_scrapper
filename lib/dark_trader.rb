# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Nokogiri
#page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))



# Array currency_names
def array_currency_names
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  array_currency_names = []

  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[2]').each do |node|
    array_currency_names << node.text
  end
return array_currency_names
end


# Array price
def array_price
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  array_price = []

  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each do |price|
    array_price << price.text
  end
return array_price
end

def hash_combined(currency_names,array_price)
  combined = Hash[array_currency_names.zip(array_price)]
end

puts hash_combined(array_currency_names,array_price)