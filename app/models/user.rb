class User < ActiveRecord::Base
  # has_many :microposts
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_save :downcase_username
  before_create :create_activation_digest
  
  has_many :subscriptions, dependent: :destroy
  has_many :concepts, through: :subscriptions

  # \w+\-. για να παίρνει τελεία και παύλα
  VALID_USERNAME_REGEX = /\A\p{Alnum}+\z/
  validates :username, presence: true, uniqueness: true,
            format: { with: VALID_USERNAME_REGEX },
            length: {maximum:20 }
  
  # valid email address according to https://tools.ietf.org/html/rfc3696#section-3 - need fix
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]*\.[a-z]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w\-\.]+\w+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum:6 }, allow_nil: true

  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
               BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    # Return a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def my_subscriptions
    # p Feed.all
    # p Subscription.all
    # p self
    Feed.joins(:subscriptions).where(subscriptions: {user_id: self.id})
    #.where(feeds: {compatible: true})
  end

  
  # Βγάζει και πηγές που ανήκουν στο χρήστη 
  def other_subscriptions
    Feed.joins(:subscriptions).where.not(subscriptions: {user_id: self.id})
  end

  # Remembers a user in the database for use in peristent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forget a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end


  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
    end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Send password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end


  def other_subscriptions
    Feed.joins(:subscriptions).where.not(subscriptions: {user_id: self.id})
  end

  private

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  # Converts email to all lower-case
  def downcase_email
    self.email = email.downcase
  end
  def downcase_username
    self.username = username.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
