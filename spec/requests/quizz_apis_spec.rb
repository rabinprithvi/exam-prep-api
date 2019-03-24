require 'rails_helper'

RSpec.describe "Quiz", type: :request do
  describe "creates quiz, accepts answer and calculates score" do
    before(:each) do
      FactoryBot.create(:question)

      FactoryBot.create(:correct_answer, question: Question.first)
      FactoryBot.create(:skipped_answer, question: Question.first)
      FactoryBot.create(:answer, question: Question.first)
    end

    it "creates quiz" do
      get quiz_chapter_path Chapter.first
      api_response = JSON.parse(response.body)

      expect(api_response['status']).to eq 200
      expect(api_response['quiz'].size).to eq 1
      expect(Quiz.any?).to be_truthy
    end

    it "accepts answer" do
      get quiz_chapter_path Chapter.first
      chosen_option = Question.first.answers.where(is_correct: true).first
      
      patch quiz_path(Quiz.first, response: chosen_option )
      api_response = JSON.parse(response.body)

      expect(api_response['status']).to eq 200
    end

    context 'scoring' do
      context 'when answer is correct' do
        it "responds with correct score" do
          get quiz_chapter_path Chapter.first
          chosen_option = Question.first.answers.where(is_correct: true).first
          patch quiz_path(Quiz.first, response: chosen_option )
         
          get score_chapter_path(Chapter.first)        
          api_response = JSON.parse(response.body)

          expect(api_response['status']).to eq 200
          expect(api_response['score']['correct_answers']).to eq '100%'
        end
      end

      context 'when answer is wrong' do
        it "responds with correct score" do
          get quiz_chapter_path Chapter.first
          chosen_option = Question.first.answers.where(is_correct: false)
                                                .where.not(option: 'Skip').first
          patch quiz_path(Quiz.first, response: chosen_option )
         
          get score_chapter_path(Chapter.first)        
          api_response = JSON.parse(response.body)

          expect(api_response['status']).to eq 200
          expect(api_response['score']['wrong_answers']).to eq '100%'
        end
      end

      context 'when answer is skipped' do
        it "responds with correct score" do
          get quiz_chapter_path Chapter.first
          chosen_option = Question.first.answers.where(is_correct: false)
                                                .where(option: 'Skip').first
          patch quiz_path(Quiz.first, response: chosen_option )
         
          get score_chapter_path(Chapter.first)        
          api_response = JSON.parse(response.body)

          expect(api_response['status']).to eq 200
          expect(api_response['score']['skipped_questions']).to eq '100%'
        end
      end

      context 'when question is not seen' do
        it "responds with correct score" do
          get quiz_chapter_path Chapter.first
          chosen_option = Question.first.answers.where(is_correct: false)
                                                .where(option: 'Skip').first
         
          get score_chapter_path(Chapter.first)        
          api_response = JSON.parse(response.body)

          expect(api_response['status']).to eq 200
          expect(api_response['score']['unseen_questions']).to eq '100%'
        end
      end
    end
  end
end
