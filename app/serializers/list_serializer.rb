class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :items_count

  has_many :items
end