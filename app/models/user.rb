class User < ActiveRecord::Base
  # has_many :microposts
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_save :downcase_name
  before_create :create_activation_digest
  
  VALID_NAME_REGEX = /\A\p{Alnum}+\z/
  validates :name, presence: true, uniqueness: true,
            format: { with: VALID_NAME_REGEX },
            length: {maximum:20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]*\.[a-z]+\z/i
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
  

  # Remembers a user in the database for use in peristent sessions.
  def remember
    self.remember_token = User.new_token
    udpate_attribute(:remember_digest, User.digest(remember_token))
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

  private

  # Converts email to all lower-case
  def downcase_email
    self.email = email.downcase
  end

  def downcase_name
    self.name = name.downcase
  end
  
  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
  
end
