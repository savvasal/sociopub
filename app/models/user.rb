class User < ActiveRecord::Base
 # has_many :microposts
  before_save { self.email = email.downcase }
  VALID_NAME_REGEX = /\A\p{Alnum}+\z/
  validates :name, presence: true, uniqueness: true,
            format: { with: VALID_NAME_REGEX },
            length: {maximum:20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum:6 }
end
