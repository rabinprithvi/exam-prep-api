require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'is valid with name' do 
    topic = FactoryBot.build(:topic, name: 'test')
    expect(topic).to be_valid
  end

  it 'is invalid without name' do 
    topic = FactoryBot.build(:topic, name: nil)
    expect(topic).to be_invalid
  end

  it 'is invalid without subject' do 
    topic = FactoryBot.build(:topic, subject: nil)
    expect(topic).to be_invalid
  end
end
