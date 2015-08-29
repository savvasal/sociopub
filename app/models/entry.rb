class Entry < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  has_many :sources, dependent: :destroy
  has_many :feeds, through: :sources

  def keywords
    doc = Pismo::Document.new(self.url)
    doc.keywords.take(3).to_h.keys
  end
  
  def save_to_file
    File.open("myentry.txt", "w") do |f|
      f.write(self.url)
    end
  end
end
