FactoryBot.define do
  factory :answer do
    option '2*22/7*r'
    is_correct true
    association :question
  end
end
