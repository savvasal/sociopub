class Feed < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  has_many :entries, through: :sources
  has_many :sources, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
    

  def subscribed_by?(user)
    Subscription.exists?(feed_id: self.id, user_id: user.id)
  end

  def fetch
    #feed = Feed.find_by(id: params[:id])
    # τραβά τα άρθρα από τη πηγή και τα καταχωρεί στη βάση
    xml = Feedjira::Feed.fetch_and_parse self.url
    xml.entries.each do |e|
      item = Entry.find_or_initialize_by(url: e.url)
      if item.new_record?
        item.title = e.title
        item.save
      end
      Source.find_or_create_by(feed_id: self.id, entry_id: item.id)
    end
  end

  

  
end
