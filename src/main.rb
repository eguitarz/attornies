$:.unshift File.expand_path("../../src", __FILE__)
require 'active_record'
require 'crawler'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db.sqlite3')
Crawler.new