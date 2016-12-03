class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :account_number, :presence => true
  has_many :accounts
  has_many :identities
  def self.authenticate(username, password)
    user = User.find_for_authentication(:name => username)
    user.valid_password?(password) ? user : nil
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_required?
     false
  end
  def password_required?
     false
  end
  # def email_verified?
  #   self.email && self.email !~ TEMP_EMAIL_REGEX
  # end
end
