FactoryBot.define do
  factory :question do
    name { Faker::Name.unique.name }
    chapter
    category { 'easy' }
    after :create do |question|
      create_list(:option, 4, question: question)
    end
  end
end
