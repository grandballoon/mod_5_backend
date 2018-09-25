class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :token

  has_many :facts
end
