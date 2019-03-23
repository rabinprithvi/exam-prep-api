require 'rails_helper'

RSpec.describe Answer, type: :model do
	it "generates associated data from a factory" do
    answer = FactoryBot.create(:answer)
    puts "question is #{answer.question.inspect}"
    puts "chapter is #{answer.question.chapter.inspect}"
    puts "topic is #{answer.question.chapter.topic.inspect}"
    puts "subject is #{answer.question.chapter.topic.subject.inspect}"
    puts "Exam is #{answer.question.chapter.topic.subject.exam.inspect}"
	end
end
