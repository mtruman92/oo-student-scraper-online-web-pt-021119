require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    #binding.pry
    html = open(index_url)
    index = Nokogiri::HTML
    #(html(open("http://142.93.56.73:60992/fixtures/student-site/"))
    binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

