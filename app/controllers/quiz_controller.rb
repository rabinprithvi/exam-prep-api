class QuizController < ApplicationController
  def index
  	create_quiz  
    @quiz  = Quiz.all
  end

  private

  def create_quiz
  	# Issue unissued questions
  	# If unissued question = 0 ,  issue skipped questions
  	exam_id = params[:exam_id]
  	subject_id = params[:subject_id]
  	topic_id = params[:topic_id]
  	chapter_id = params[:chapter_id]

  	exam = Exam.find(exam_id.to_i) if params[:exam_id]

  	exam.questions.each do |question|
  		  User.first.quiz.create(question: question)
    end
  end
end
