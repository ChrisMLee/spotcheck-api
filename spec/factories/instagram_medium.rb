FactoryBot.define do
  factory :instagram_medium do
    link { Faker::Lorem.word }
    added_by { Faker::Number.number(10) }
  end
end
