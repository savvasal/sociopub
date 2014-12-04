class BookmarkUserRelationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :bookmark, class_name: "Bookmark"
  validates :user_id, presence: true
  validates :bookmark_id, presence: true
end
