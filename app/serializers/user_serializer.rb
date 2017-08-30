class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :outlets
end
