class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :token, :phone_number

  has_many :facts
end
