FactoryBot.define do
  factory :exam do
    name { Faker::Name.unique.name }
  end
end
