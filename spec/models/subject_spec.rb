require 'rails_helper'

RSpec.describe Subject, type: :model do
	it 'is valid with name' do 
		subject = FactoryBot.build(:subject, name: 'test')
		expect(subject).to be_valid
	end

	it 'is invalid without name' do 
		subject = FactoryBot.build(:subject, name: nil)
		expect(subject).to be_invalid
	end

	it 'is invalid without exam' do 
		subject = FactoryBot.build(:subject, exam: nil)
		expect(subject).to be_invalid
	end
end
