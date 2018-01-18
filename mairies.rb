
Page_URL = "http://annuaire-des-mairies.com/val-d-oise.html"
Page_city = "http://annuaire-des-mairies.com/95/vaureal.html"


def get_the_email_of_a_townhal_from_its_webpage(webpage_mail)
  page = Nokogiri::HTML(open(webpage_mail))
  page.css('p.Style22').each do |element| #à l'aide de l'outil développeur je suis aller chercher sur la page web l'emplaclement du tableau d'info =>p.Style22
    if element.text.include? "@" #j'utilise "@" pour distinguer l'email des autres éléments du tableau
      return element.text
    end
  end
end

def get_all_the_urls_of_val_doise_townhalls(webpage_url)
  page = Nokogiri::HTML(open(webpage_url))
  webpages_list=[]
    page.css("a.lientxt").each do |url|
      url['href'] = url['href'][1..-1]#retire le . devant l'url
      webpages = "http://annuaire-des-mairies.com" + url['href']
    webpages_list<<webpages#ajoute les résultats à l'array
    end
    webpages_list
end

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'


email_list=[]
get_all_the_urls_of_val_doise_townhalls(Page_URL).each do |url|
  email_list<<get_the_email_of_a_townhal_from_its_webpage(url)
end

puts email_list
