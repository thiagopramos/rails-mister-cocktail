module ApplicationHelper
  require 'nokogiri'
  require 'open-uri'

  def get_thumb_from_google(query)

  # Get a Nokogiri::HTML:Document for the page we’re interested in...

  doc = Nokogiri::HTML(open("http://allrecipes.com/search/results/?wt=drink%20#{query}&sort=re"))

  # Do funky things with it using Nokogiri::XML::Node methods...
  # puts doc
  ####
  # Search for nodes by css
  art = doc.css("article")
  img = art.css('.grid-col__rec-image')[0]
  img.attr('data-original-src') unless img.nil?

  end
end
