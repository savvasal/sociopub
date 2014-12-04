class UserFeedSubscription < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :feed, class_name: "Feed"
end
