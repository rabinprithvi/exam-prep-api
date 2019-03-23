FactoryBot.define do
  factory :subject do
    name 'Math' 
    association :exam
  end
end
