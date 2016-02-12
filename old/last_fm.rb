# module LastFm
#   class Statistics
#     attr_reader :url, :page

#     def initialize(user)
#       @url = "http://www.last.fm/user/#{user}"
#       @page = Nokogiri::HTML(RestClient.get(url))
#     end

#     def weekly_top_artists
#       page.css('.grid-items-item').take(5).map do |grid|
#         [
#           grid.css('.grid-items-item-main-text a').text.strip,
#           'http://www.last.fm' + grid.css('.grid-items-item-main-text a').first['href'],
#           grid.css('.grid-items-item-aux-text a').text.delete('plays').strip
#         ]
#       end
#     end
#   end
# end
