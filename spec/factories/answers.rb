FactoryBot.define do
  factory :answer do
    option { 'test' }
    is_correct { false }
    association :question 

    factory :correct_answer do
    	is_correct { true }
    end

    factory :skipped_answer do |a|
    	option { 'Skip' }
    end
    	
    
  end
end
