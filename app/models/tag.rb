class Tag < ActiveRecord::Base
  has_many :bookmark_user_tag_relationships, foreign_key: "tag_id"

  has_many :bundle_tags, foreign_key: "tag_id"

  has_many :auto_tag_bookmarks, foreign_key: "tag_id"
end
