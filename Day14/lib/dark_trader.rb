# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'


# Création de l'array contenant les noms des cryptos
def array_currency_names
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  array_currency_names = []

  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[2]').each do |name|
    array_currency_names << name.text
  end
return array_currency_names
end


# Création de l'array contenant les valeurs des cryptos
def array_price
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  array_price = []

  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each do |price|
    array_price << price.text
  end
return array_price
end

# Création du hash contenant les noms et valeurs des cryptos
def hash_combined(array_currency_names,array_price)
  combined = Hash[array_currency_names.zip(array_price)]
  puts combined
end

# Methode perform
def perform
  hash_combined(array_currency_names,array_price)
end

# Run du programme
perform

