class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :games

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence:true, length: { minimum: 6 }

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def is_admin?
    return (is_admin == 1)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    remember_digest == remember_token
  end

  def games_rented
    rented = RentTable.where(:user_id => id)
    return rented
  end

  def game_rented?(game_id)
    rented = RentTable.where(:user_id => id, :game_id =>game_id)
    return rented.any?
  end
end
