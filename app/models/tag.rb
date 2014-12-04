class Tag < ActiveRecord::Base
  has_many :bookmark_user_tag_relationships, foreign_key: "tag_id"
end
