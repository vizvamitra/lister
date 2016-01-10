require 'rails_helper'

RSpec.describe List, :type => :model do
  subject{ build(:list) }

  describe 'validations' do
    it{ is_expected.to validate_presence_of(:name) }
    it{ is_expected.to validate_presence_of(:user) }
  end

  describe 'associations' do
    it{ is_expected.to belong_to(:user) }
    it{ is_expected.to have_many(:items) }

    it 'deletes all list items on destroy' do
      list = create(:list, items: [create(:list_item)])
      expect{list.destroy}.to change(ListItem, :count).by(-1)
    end
  end
end
