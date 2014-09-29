class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation

  validates :name,
    presence: true,
    length: { maximum: 32 },
    uniqueness: { case_sensitive: false }
  validates :password,
    presence: true,
    length: { minimum: 6 },
    confirmation: { allow_blank: true }
end
