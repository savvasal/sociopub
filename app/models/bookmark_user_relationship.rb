class BookmarkUserRelationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :bookmark, class_name: "Bookmark"
  has_many :bookmark_user_tag_relationships, foreign_key: "bookmark_user_relationship_id"
  has_many :tags, through: :bookmark_user_tag_relationships

  validates :user_id, presence: true
  validates :bookmark_id, presence: true
end
