class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthday, :outlets, :football, :baseball, :basketball
end
