FactoryBot.define do
  factory :option do
    name { Faker::Name.unique.name }
  end
end
