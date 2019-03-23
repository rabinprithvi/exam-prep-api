require 'rails_helper'

RSpec.describe "QuizzApis", type: :request do
  describe "GET /quizz_apis" do
    it "responds with set of questions" do
      answer1 = FactoryBot.create(:answer, option: 'Option 1')
      answer2 = FactoryBot.create(:answer, option: 'Option 2')
      answer3 = FactoryBot.create(:answer, option: 'Option 3')
      answer4 = FactoryBot.create(:answer, option: 'Option 4')

      get 'localhost:3000/exams/1/subjects/1/topics/1/chapters/1/quizz' 
      expect(response).to have_http_status(:success)
    end
  end
end
