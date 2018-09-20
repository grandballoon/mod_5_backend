class Fact < ApplicationRecord
  validates :description, :source, presence: true
end
