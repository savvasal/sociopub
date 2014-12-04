class BundleTag < ActiveRecord::Base
  belongs_to :tag, class_name: "Tag"
  belongs_to :bundle, class_name: "Bundle"
end
