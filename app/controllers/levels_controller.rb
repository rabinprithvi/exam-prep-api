class LevelsController < ApplicationController
def quiz
    @topic = Topic.find(params[:id])
    @quiz = quiz_picker.unissued_quiz 
    @quiz = quiz_picker.skipped_quiz if @quiz.empty?
    render partial: 'shared/quiz'
  end

  def score
    @topic = Topic.find(params[:id])
    @score = scorer.score
    render partial: 'shared/score'
  end

  private

  def quiz_picker
    @quiz_picker ||= QuizPicker.new resource
  end  

  def scorer
    @scorer = Scorer.new resource
  end

  def resource
   resource = model.find(params[:id])
  end 

  def model
    params[:controller].singularize
                       .titleize
                       .constantize
  end
end
