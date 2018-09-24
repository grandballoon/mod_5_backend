class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :token
end
