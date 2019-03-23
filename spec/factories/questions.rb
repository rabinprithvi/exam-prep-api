FactoryBot.define do
  factory :question do
    question 'What is the permiter of a circle?'
    category_type 0
    association :chapter
  end
end
