class List < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "ListItem", dependent: :destroy

  validates_presence_of :name, :user
end
