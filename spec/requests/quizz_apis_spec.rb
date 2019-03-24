require 'rails_helper'

RSpec.describe "Quiz", type: :request do
  describe "listing API responds with questions" do
    it "responds with chapter questions" do
      create_question_answers
      get quiz_chapter_path Chapter.first
      api_response = JSON.parse(response.body)
      expect(api_response['status']).to eq 200
      expect(api_response['quiz'].size).to eq 2
      expect(api_response['quiz'].first['options'].size).to eq 2
    end
    it "responds with topic questions" do
      create_question_answers
      get quiz_topic_path Topic.first
      api_response = JSON.parse(response.body)
      expect(api_response['status']).to eq 200
      expect(api_response['quiz'].size).to eq 2
      expect(api_response['quiz'].first['options'].size).to eq 2
    end
  end

  def create_question_answers
      FactoryBot.create(:question)
      FactoryBot.create(:question, chapter: Question.first.chapter)
      FactoryBot.create_list(:answer, 2, question: Question.first)
      FactoryBot.create_list(:answer, 2, question: Question.last)
  end
end
