class FactSerializer < ActiveModel::Serializer
  attributes :id, :description, :source

  belongs_to :category
end
