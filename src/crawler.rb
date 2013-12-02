require 'nokogiri'
require 'open-uri'

class Crawler
	BASE_URL = 'http://service.moj.gov.tw/lawer/'
	START_PAGE = BASE_URL + 'basesearch.asp'
	def initialize
		fetch_lists
	end

	def fetch_lists
		src = open START_PAGE
		pg = Nokogiri::HTML(src)
		pg.css('table tbody tr td > a').each do |link|
			puts "#{BASE_URL + link.attribute('href')}"
			names_src = open URI::encode(BASE_URL + link.attribute('href').to_s().encode('big5'))
			names_page = Nokogiri::HTML(names_src)
			names_page.css('a').each do |name_link|
				# puts name_link.content
				script = name_link.attribute('onclick').to_s
				params_hash = script.split(';')
				params_hash.map do |v|
					result = v.split '='
					result.last.gsub!('\'', '') if result.last
					p result.last
				end

			end
			break
		end
	end
end