class Fact < ApplicationRecord
  validates :description, :source, presence: true

  has_many :subscriptions
  has_many :users, through: :subscriptions
end
