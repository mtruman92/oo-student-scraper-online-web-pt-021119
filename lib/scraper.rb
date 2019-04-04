require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_list = []
        html = open(index_url)
      Nokogiri::HTML(open("http://142.93.56.73:34389/fixtures/student-site/"))
    list = Nokogiri::HTML(html)
    list.css(".student-card").collect do |student|
      student_list << {
        :name => list.css("h4.student-name").text,
        :location => list.css("p.student-location").text,
        :profile_url => "./fixtures/student-site/index.html" + list.css("a").attribute("href")
      }
        end
        student_list
      end

  def self.scrape_profile_page(profile_url)
    
  end

end


