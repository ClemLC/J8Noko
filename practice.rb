require 'rubygems'
require 'nokogiri'
require 'open-uri' #On peut aussi utiliser 'restclient'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/chapters/html-parsing/#sample-html")) #et si on utilise 'restclient'page = Nokogiri::HTML(RestClient.get("https://www.surf-report.com/"))
puts page.class #=> si on fait tourner dans le terminal = Nokogiri::HTML::Document

news_links = page.css("div#references p a")
news_links.each { |link| puts "#{link.text}\t#{link['href']}"}
