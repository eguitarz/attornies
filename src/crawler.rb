require 'nokogiri'
require 'open-uri'

class Crawler
	BASE_URL = 'http://service.moj.gov.tw/lawer/'
	START_PAGE = BASE_URL + 'basesearch.asp'
	def initialize
		fetch_lists
	end

	def fetch_lists
		src = open(START_PAGE)
		pg = Nokogiri::HTML(src)
		pg.css('table tbody tr td > a').each do |link|
			puts "#{BASE_URL + link.attribute('href')}"
		end
	end
end