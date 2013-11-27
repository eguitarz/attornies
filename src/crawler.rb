require 'nokogiri'
require 'open-uri'

class Crawler
	START_PAGE = 'http://service.moj.gov.tw/lawer/basesearch.asp'
	def initialize
		fetch_lists
	end

	def fetch_lists
		pg = Nokogiri::HTML(open(START_PAGE))
	end
end