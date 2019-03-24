require 'rails_helper'

RSpec.describe "Quiz", type: :request do
  describe "listing API responds with questions" do
    it "responds with set of questions" do
      create_question_answers
      get quiz_chapter_path Chapter.first
      api_response = JSON.parse(response.body)
      expect(api_response['status']).to eq 200
      expect(api_response['quiz'].size).to eq 2
      expect(api_response['quiz'].first['options'].size).to eq 2
    end
  end
  def create_question_answers
      question1 = FactoryBot.create(:question)
      chapter = question1.chapter
      question2 = FactoryBot.create(:question, chapter: chapter)
      
      answer1 = FactoryBot.create(:answer, question: question1)
      answer2 = FactoryBot.create(:answer, question: question1)
      answer3 = FactoryBot.create(:answer, question: question2)
      answer4 = FactoryBot.create(:answer, question: question2)

  end
end
