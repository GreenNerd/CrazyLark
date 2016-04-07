class User < ActiveRecord::Base
  before_create :generate_authentication_token
  attr_accessor :remember_token
  validates :mobile, presence: true, length: { is: 11 }, numericality: true,
                 uniqueness: true
  validates :password, presence: true, length: { maximum: 6 }
  #			format: { with VALID_PASSWORD_REGEX }
  #VALID_PASSWORD_REGEX = ^[a-zA-Z][a-zA-Z0-9_]{4,15}$
  validates :key, presence: true, length: { maximum:16 },
                 uniqueness: true
  has_secure_password
	
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                                               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #login authentiaction
  def generate_authentication_token
    loop do 
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end
  #reset login authtication
  def reset_auth_token!
    generate_authentication_token
    save
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

# def remember
# self.remember_token = User.new_token
# update_attribute(:remember_digest,User.digest(remember_token))
# end

  #reset password authentication
  def create_reset_digest
  	self.reset_digest = User.new_token
  	update_attribute(:reset_digest, User.digest(reset_token))
  	update_attribute(:reset_sent_at, Time.zone.now)
  end
end
