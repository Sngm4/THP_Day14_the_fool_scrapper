# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Création de la méthode donnant le lien du Nokogiri
def scrapping(url)
  page = Nokogiri::HTML(URI.open(url))
  return page
end

# Création de l'array contenant les mails des mairies.
def get_townhall_email(page)
  array_townhall_email = []

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
  puts array_of_urls
  return array_of_urls
end

def get_townhall_names(page)
  #page = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
  
  array_of_names = []

  array_of_names = page.xpath('//a[@class="lientxt"]').map{|x| x.text}
  puts array_of_names
end

def get_townhall_email_all(array_townhall_email,array_of_urls)
  array_of_urls.each do |url| 
    get_townhall_email("https://www.annuaire-des-mairies.com/95/" + url)
    array_mail << result.text
  end
  puts array_mail
  return array_mail
end

def program
  
  page_mail = scrapping("https://www.annuaire-des-mairies.com/95/avernes.html")
  page_url = scrapping("https://www.annuaire-des-mairies.com/val-d-oise.html")
  page_names = scrapping("https://www.annuaire-des-mairies.com/val-d-oise.html")
  array_townhall_email = get_townhall_email(page_mail)
  array_of_urls = get_townhall_url(page_url)
  get_townhall_names(page_names)
  get_townhall_email_all(array_townhall_email,array_of_urls)
end

program

