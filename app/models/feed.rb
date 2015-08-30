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


#  def compatible
#  update_attribute(:compatible, "true")
#  end

#  def incompatible
#    update_attribute(:compatible, "false")
#  end
  
  
end
