require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'is valid with option' do 
    answer = FactoryBot.build(:answer, option: 'test')
    expect(answer).to be_valid
  end

  it 'is invalid without option' do 
    answer = FactoryBot.build(:answer, option: nil)
    expect(answer).to be_invalid
  end

  it 'is invalid without question' do 
    answer = FactoryBot.build(:answer, question: nil)
    expect(answer).to be_invalid
  end  
end
