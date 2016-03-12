class Word < ActiveRecord::Base
  has_many :bundles
  has_many :concepts, through: :bundles
  has_many :keywords
  has_many :entries, through: :keywords
end
