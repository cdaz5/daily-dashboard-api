class SourceSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :name, :description, :url, :category, :language, :country
end
