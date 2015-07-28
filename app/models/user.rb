class User < ActiveRecord::Base
 # has_many :microposts
  before_save { self.email = email.downcase }
  before_save { self.name = name.downcase }
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

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Return a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in peristent sessions.
  def remember
    self.remember_token = User.new_token
    udpate_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticate?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forget a user
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
