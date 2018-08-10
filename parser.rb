require 'open-uri'

first_second_true = 0
first_second_false = 0
second_third_true = 0
second_third_false = 0

url = 'https://www.hltv.org/matches/2325521/fnatic-academy-vs-havu-oga-counter-pit'
html = open(url)

require 'nokogiri'
doc = Nokogiri::HTML(html)

divs = doc.css('div.results')
map_results_string = divs.css('span.won, span.lost')

map_results = map_results_string.map { |s| s.inner_html.to_i }
maps_count = map_results.count / 2

if maps_count > 1
  first_map_total = map_results[0] + map_results[1]
  if first_map_total > 26.5
    second_map_total = map_results[2] + map_results[3]
    if second_map_total < 26.5
      first_second_true += 1
    else
      first_second_false += 1
    end
  else
  end
  if maps_count > 2
    second_map_total = map_results[2] + map_results[3]
    if second_map_total > 26.5
      third_map_total = map_results[4] + map_results[5]
      if third_map_total < 26.5
        second_third_true += 1
      else
        second_third_false += 1
      end
    else
  end
  end
end

puts first_second_true
puts first_second_false
puts second_third_true
puts second_third_false
