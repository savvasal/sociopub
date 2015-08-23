class Entry < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  has_many :sources, dependent: :destroy
  has_many :feeds, through: :sources

  def keywords
    doc = Pismo::Document.new(self.url)
    doc.keywords.take(3).to_h.keys
  end
end
