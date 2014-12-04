class Feed < ActiveRecord::Base
  has_many :user_feed_subscriptions, foreign_key: "feed_id"
end
