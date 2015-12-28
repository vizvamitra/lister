require 'rails_helper'

RSpec.describe ListItem, type: :model do
  subject{ build(:list_item) }

  describe 'validations' do
    it{ is_expected.to validate_presence_of(:body) }
    it{ is_expected.to validate_presence_of(:list) }
  end

  it{ is_expected.to belong_to(:list) }
end
