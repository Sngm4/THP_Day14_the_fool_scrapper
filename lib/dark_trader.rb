# Requirement
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Nokogiri
page = Nokogiri::HTML(URI.open("link")
puts page.css