FactoryBot.define do
  factory :subject do
    name { Faker::Name.unique.name }
    exam
  end
end
