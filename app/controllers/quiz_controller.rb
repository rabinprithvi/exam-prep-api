class QuizController < ApplicationController
  def update
    @quiz = Quiz.find(params[:id])
    response = Answer.find(params[:response])
    is_skipped = response.option == 'Skip'
    is_correct = response.is_correct unless is_skipped

    @quiz.update(response: response.id,
                is_correct: is_correct,
                is_skipped: is_skipped)
  end
end
