require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'is valid with question' do 
    question = FactoryBot.build(:question, question: 'test')
    expect(question).to be_valid
  end

  it 'is invalid without question' do 
    question = FactoryBot.build(:question, question: nil)
    expect(question).to be_invalid
  end

  it 'is invalid without category type' do 
    question = FactoryBot.build(:question, category_type: nil)
    expect(question).to be_invalid
  end

  it 'is valid with category type' do 
    question = FactoryBot.build(:question, category_type: 'easy' )
    expect(question).to be_valid
  end

  it 'is invalid without chapter' do 
    question = FactoryBot.build(:question, chapter: nil)
    expect(question).to be_invalid
  end
end
