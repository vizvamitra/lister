class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :body, :completed
end
