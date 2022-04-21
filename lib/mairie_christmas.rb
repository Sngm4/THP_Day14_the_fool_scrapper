# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Création de la méthode donnant le lien du Nokogiri
#def townhall_url
#  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
#  return townhall_url
  #end
#end

# Création de l'array contenant les mails des mairies.
def get_townhall_email
  #page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))

  array_townhall_email = []

  page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |result|
    array_townhall_email << result.text
    end
  puts array_townhall_email
end

# Création d'une méthode qui récupère les URL de chaque mairie.

def get_townhalls_urls
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

  array_townhall_urls = []

  page.xpath("/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table/tbody/tr/td[3]/p/a[2]").each do |result|
    array_townhall_urls << result.text
  end
  puts array_townhall_urls
end

get_townhalls_urls

#def perform
  get_townhall_email
#  get_townhalls_urls
  #end


#perform