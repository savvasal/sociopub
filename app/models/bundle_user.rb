class BundleUser < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :bundle, class_name: "Bundle"
end
