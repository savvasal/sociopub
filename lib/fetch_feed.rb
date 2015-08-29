require "feedjira"
require "pismo"
require "whatlanguage"
require "addressable/uri"

class FetchFeed

  def initialize(feed, parser: Feedjira::Feed, logger: nil)
    @feed = feed
    @parser = parser
    @logger = logger
    end


  # Λαμβάνει το xml αρχείο και εξάγει τα άρθρα από αυτό
  #
  #
  # @notes Χρειάζεται βελτίωση το forloop να μην βλέπει τα ίδια άρθρα - issue #
  def fetch
    raw_feed = @parser.fetch_and_parse(@feed.url)
    raw_feed.entries.each do |entry|      
      website = Website.find_or_create_by(url: Addressable::URI.parse(entry.url).host)
      if website.compatible 
        article = Entry.find_or_initialize_by(url: entry.url)
        if article.new_record?
          document = Pismo::Document.new(entry.url)
          article.title = document.title
          article.content = document.body
          article.published = document.datetime

          what = WhatLanguage.new(:all)
          article.language = what.language(document.body)
          article.save

          Source.find_or_create_by(feed_id: @feed.id, entry_id: article.id)
        end
      end
    end
  end
  
end

