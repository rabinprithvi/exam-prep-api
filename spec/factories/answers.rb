FactoryBot.define do
  factory :answer do
    option { 'test' }
    is_correct { false }
    association :question 

    factory :correct_answer do
    	is_correct { true }
    end
  end
end
