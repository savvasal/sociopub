class Feed < ActiveRecord::Base
  has_many :user_feed_subscriptions, foreign_key: "feed_id"
  has_many :bundle_feeds, foreign_key: "feed_id"

  has_and_belongs_to_many :bookmarks

end
