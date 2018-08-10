require 'open-uri'

url = 'https://www.hltv.org/results?offset=100'
html = open(url)

require 'nokogiri'
doc = Nokogiri::HTML(html)

match_strings = doc.css('a.a-reset').select {|node| node['href'].include? '/matches/'}.map {|node| node['href']}

each match_strings

puts match_strings

