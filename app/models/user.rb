class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # # app/models/user.rb
  has_many :articles
  validate :validate_username
  has_and_belongs_to_many :groups
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  attr_writer :login

  def login
    @login || self.user_name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
