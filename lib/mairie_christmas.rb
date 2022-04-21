# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Création de la méthode donnant le lien du Nokogiri
def scrapping(url)
  return Nokogiri::HTML(URI.open(url))
end

# Création de l'array contenant les mails des mairies.
def get_townhall_email(url)
  array_townhall_email = []
 page = scrapping(url)
  page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |result|
    array_townhall_email << result.text
    end
  puts array_townhall_email
  return array_townhall_email
end

# Création de l'array contenant les URL des mairies.
def get_townhall_url(page)
  
  array_of_urls = []

  array_of_urls = page.xpath('//a[@class="lientxt"]').map{|x| x.text.to_s.downcase.gsub(" ", "-")}.join('.html ').split
  return array_of_urls
end

def get_townhall_names(url)
  page = scrapping(url)
  array_of_names = []

  array_of_names = page.xpath('//a[@class="lientxt"]').map{|x| x.text}
  return array_of_names
end



def get_all_mail(url)
  page = scrapping(url)
  array_of_urls = get_townhall_url(page)
  #get_townhall_names(page)

  array_mail = []
  array_of_urls.each do |url| 
    result = get_townhall_email("https://www.annuaire-des-mairies.com/95/" + url)
    array_mail << result
  end
  return array_mail
end

def hash_combined(array_of_names,array_mail)
  combined = Hash[array_of_names.zip(array_mail)]
  puts combined
end

def perform
  url = "https://www.annuaire-des-mairies.com/val-d-oise.html"
  array_of_names = get_townhall_names(url)
  array_mail = get_all_mail(url)
  hash_combined(array_of_names,array_mail)
end

perform