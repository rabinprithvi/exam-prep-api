require 'rails_helper'

RSpec.describe Chapter, type: :model do
  it 'is valid with name' do 
    chapter = FactoryBot.build(:chapter)
    expect(chapter).to be_valid
  end

  it 'is invalid without name' do 
    chapter = FactoryBot.build(:chapter, name: nil)
    expect(chapter).to be_invalid
  end

  it 'is invalid without topic' do 
    chapter = FactoryBot.build(:chapter, topic: nil)
    expect(chapter).to be_invalid
  end
end
