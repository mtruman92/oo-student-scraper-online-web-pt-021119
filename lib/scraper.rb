require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
  student_information = []

  index = Nokogiri::HTML(open(index_url))
  student_card = index.css(".student-card")
    student_card.each do |student|
    name = student.css(".student-name").text
    location = student.css(".student-location").text
    student_url = student.css("a").attribute("href").value
    student_information << {location: location, name: name, profile_url: student_url}
  end
  student_information
       end
     

  def self.scrape_profile_page(profile_url)
  student_list = {}
  
      html = Nokogiri::HTML(open(profile_url))
      html.css("div.social-icon-container a").each do |student|
       if student.attribute("href").value.include?("twitter")
         student_list[:twitter] = student.attribute("href").value
      elsif student.attribute("href").value.include?("linkedin")
      student_list[:linkedin] = student.attribute("href").value
      elsif student.attribute("href").value.include?("github")
      student_list[:github] = student.attribute("href").value 
    else student_list[:blog] = student.attribute("href").value
  end

end

  student_list[:profile_quote] = html.css("div.profile-quote").text
  student_list[:bio] = html.css("div.bio-content.content-holder p").text 
  student_list
end
end


