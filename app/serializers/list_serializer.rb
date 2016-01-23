class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :items_count
end