class Entry < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  has_many :keywords
  has_many :words, through: :keywords
end
