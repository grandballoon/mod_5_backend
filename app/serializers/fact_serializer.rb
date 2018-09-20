class FactSerializer < ActiveModel::Serializer
  attributes :id, :description, :source, :verified
end
