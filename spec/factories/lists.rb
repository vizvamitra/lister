FactoryGirl.define do
  factory :list do
    name { Faker::Name.first_name }
    user
  end
end