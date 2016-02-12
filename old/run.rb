# require 'pry'
# require 'nokogiri'
# require 'rest-client'

# require_relative 'last_fm'
# require_relative 'mailer'

# top1 = LastFm::Statistics.new('theblackmoon767').weekly_top_artists
# top2 = LastFm::Statistics.new('efemental').weekly_top_artists

# file = File.open('log', 'w')
# file.write 'theblackmoon767<br/>'
# top1.each do |band, link, number|
#   file.write "<a href=\"#{link}\">#{band}</a> #{number}<br/>\n"
# end
# file.write '<br/>efemental<br/>'
# top2.each do |band, link, number|
#   file.write "<a href=\"#{link}\">#{band}</a> #{number}<br/>\n"
# end
# file.close
# Mailer.new('test', 'log').deliver

# # Pry.start
