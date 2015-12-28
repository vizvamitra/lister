class List < ApplicationRecord
  belongs_to :user
  has_many :list_items, dependent: :destroy

  validates_presence_of :name, :user
end
