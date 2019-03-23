class TopicsController < ApplicationController
  def quiz
    @topic = Topic.find(params[:id])
    @quiz = quiz_picker.unissued_quiz 
    @quiz = quiz_picker.skipped_quiz if @quiz.empty?
  end

  def score
    @topic = Topic.find(params[:id])
    @score = scorer.score
  end

  private

  def quiz_picker
    @quiz_picker ||= QuizPicker.new(@topic)
  end  

  def scorer
    @scorer = Scorer.new(@topic)
  end
end
