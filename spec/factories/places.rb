FactoryBot.define do
  factory :place do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(3, true)
    rating { Faker::Number.number(5) }
    created_by { Faker::Number.number(10) }
  end
end
