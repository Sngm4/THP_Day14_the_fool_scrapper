# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Création de la méthode donnant le lien du Nokogiri
def scrapping(url)
  return Nokogiri::HTML(URI.open(url))
end

# Création de la méthode donnant le nom, prénom du député
def name_firstname_deputy(url)

  page = scrapping(url)
  
  name_firstname_deputy = page.xpath("/html/body/div/div[2]/div/div/section/div/article/div[3]/div/div[3]/div[1]/ul[1]/li[1]/a").text
  
  puts name_firstname_deputy
  return name_firstname_deputy
end

# Création de la méthode donnant le mail du député
def mail_deputy(url)

  page = scrapping(url)
  
  mail_deputy = page.xpath("/html/body/div/div[2]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text
  
  puts mail_deputy
  return mail_deputy
end

# Création de la méthode donnant l'URL pour chaque député
def get_all_urls_deputies(url)
  page = scrapping(url)
  array_of_urls = []

  page.xpath('/html/body/div/div[2]/div/div/section/div/article/div[3]/div/div[3]//a/@href').each do |new_url|
  
    array_of_urls << "https://www2.assemblee-nationale.fr" + new_url
  end
  
  puts array_of_urls
  return array_of_urls
end

# Création de la méthode donnant le mail de chaque député
def get_all_mail_deputies(url)
  page = scrapping(url)
  array_of_mails = []

  page.xpath('/html/body/div/div[2]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |mail|
  
    array_of_mails << mail
  end
  
  puts array_of_mails
  return array_of_mails
end

def perform
  url_name = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
  url_mail = "https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"
  name_firstname_deputy(url_name)
  mail_deputy(url_mail)
  #get_all_urls_deputies(url_name)
  get_all_mail_deputies(url_mail)
end

perform