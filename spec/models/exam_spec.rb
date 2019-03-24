require 'rails_helper'

RSpec.describe Exam, type: :model do
	it 'is valid with name' do 
		exam = FactoryBot.build(:exam, name: 'test')
		expect(exam).to be_valid
	end

	it 'is invalid without name' do 
		exam = FactoryBot.build(:exam, name: nil)
		expect(exam).to be_invalid
	end
end
