class Bookmark < ActiveRecord::Base
  has_many :bookmark_user_relationships, foreign_key: "bookmark_id"
end
