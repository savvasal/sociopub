class BundleFeed < ActiveRecord::Base
  belongs_to :bundle, class_name: "Bundle"
  belongs_to :feed, class_name: "Feed"
end
