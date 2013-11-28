require 'nokogiri'
require 'open-uri'

class Crawler
	START_PAGE = 'http://service.moj.gov.tw/lawer/basesearch.asp'
	def initialize
		fetch_lists
	end

	def fetch_lists
		src = open(START_PAGE)
		pg = Nokogiri::HTML(src)
		pg.css('table tbody tr td > a').each do |link|
			puts "#{link.content} - #{link.attribute('href')}"
		end
	end
end