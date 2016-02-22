FactoryGirl.define do
  factory :list_item do
    list
    body Faker::Lorem.sentence
    completed false

    trait(:completed){completed true}
  end
end
