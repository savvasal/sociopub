class AutoTagBookmark < ActiveRecord::Base
  belongs_to :tag, class_name: "Tag"
  belongs_to :bookmark, class_name: "Bookmark"
end
