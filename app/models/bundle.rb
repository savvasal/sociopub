class Bundle < ActiveRecord::Base
  has_many :bundle_feeds, foreign_key: "bundle_id"
  has_many :feeds, through: :bundle_feeds

  has_many :bundle_tags, foreign_key: "bundle_id"
  has_many :tags, through: :bundle_tags

  has_many :bundle_user, class_name: "BundleUser"

end
