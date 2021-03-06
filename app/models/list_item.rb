class ListItem < ApplicationRecord
  belongs_to :list, counter_cache: :items_count

  validates_presence_of :list, :body

  def toggle_completed
    update(completed: !completed)
  end
end
