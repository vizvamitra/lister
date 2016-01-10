class ListItem < ApplicationRecord
  belongs_to :list, counter_cache: :items_count

  validates_presence_of :list, :body
end
