class Fact < ApplicationRecord
  validates :description, :source, presence: true

  has_many :subscriptions
  has_many :users, through: :subscriptions
  belongs_to :category
end
