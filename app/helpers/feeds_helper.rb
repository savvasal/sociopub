#require 'open-uri'

module FeedsHelper

  def pull_feed(feed_url = '')
    if feed_url.empty?
      puts "empty url"
    else
      SimpleRSS.parse open(feed_url)
    end
  end

  
end
