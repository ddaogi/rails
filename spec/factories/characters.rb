FactoryBot.define do
  factory :character do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
  end
end
