class ListsSerializer < ActiveModel::Serializer
  attributes :id, :name, :items_count
end