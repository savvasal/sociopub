class BookmarkUserTagRelationship < ActiveRecord::Base
  belongs_to :tag, class_name: "Tag"
  belongs_to :bookmark_user_relationship, class_name: "BookmarkUserRelationship"
  validates :tag_id, presence: true
  validates :bookmark_user_relationship_id, presence: true
end
