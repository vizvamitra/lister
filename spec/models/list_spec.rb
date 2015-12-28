require 'rails_helper'

RSpec.describe List, :type => :model do
  subject{ build(:list) }

  it{ is_expected.to validate_presence_of(:name) }
  it{ is_expected.to validate_presence_of(:user) }
  it{ is_expected.to belong_to(:user) }
end
