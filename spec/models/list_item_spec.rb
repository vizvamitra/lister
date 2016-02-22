require 'rails_helper'

RSpec.describe ListItem, type: :model do
  subject{ build(:list_item) }

  describe 'validations' do
    it{ is_expected.to validate_presence_of(:body) }
    it{ is_expected.to validate_presence_of(:list) }
  end

  it{ is_expected.to belong_to(:list) }

  describe '#toggle_completed' do
    let(:item){ create(:list_item, :completed) }

    it 'changes #completed value to the oposite' do
      expect{ item.toggle_completed }.to change(item, :completed).from(true).to(false)
      expect{ item.toggle_completed }.to change(item, :completed).from(false).to(true)
    end

    it 'persists changes' do
      item.toggle_completed
      expect(item.reload.completed).to eq false
    end
  end
end
