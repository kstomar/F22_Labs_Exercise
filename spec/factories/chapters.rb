FactoryBot.define do
  factory :chapter do
    name { Faker::Name.unique.name }
    topic
  end
end
