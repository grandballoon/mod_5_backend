class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  has_many :subscriptions
  has_many :facts, through: :subscriptions
end
