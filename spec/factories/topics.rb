FactoryBot.define do
  factory :topic do
    name { Faker::Name.unique.name }
    subject
  end
end
