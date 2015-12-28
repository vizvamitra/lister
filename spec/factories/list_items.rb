FactoryGirl.define do
  factory :list_item do
    list
    body Faker::Lorem.sentence
    done false

    trait(:done){done true}
  end
end
