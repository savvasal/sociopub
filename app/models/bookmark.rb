class Bookmark < ActiveRecord::Base
  has_many :bookmark_user_relationships, foreign_key: "bookmark_id"

  has_and_belongs_to_many :feeds

  has_many :auto_tag_bookmarks, foreign_key: "bookmark_id"
  has_many :tags, through:  :auto_tag_bookmarks

end
