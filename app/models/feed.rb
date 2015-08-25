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
    # να ελέγχει το host url - αν υπάρχει στη βάση - αν δεν υπάρχει να το βάλει
    # και να ελέγχει αν είναι συμβατό
    xml = Feedjira::Feed.fetch_and_parse self.url
    xml.entries.each do |e|
      # aprox 2 ms each
      item = Entry.find_or_initialize_by(url: e.url)
      if item.new_record?
        item.title = e.title
        item.save
      end
      # aprox 2-5ms each
      Source.find_or_create_by(feed_id: self.id, entry_id: item.id)
    end
  end

#  def compatible
#  update_attribute(:compatible, "true")
#  end

#  def incompatible
#    update_attribute(:compatible, "false")
#  end
  

  
end
