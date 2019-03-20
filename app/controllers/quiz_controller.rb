class QuizController < ApplicationController
  def index
  	create_quiz  
    @quiz  = Quiz.first  
  end

  private

  def create_quiz
  	# Issue unissued questions
  	# If unissued question = 0 ,  issue skipped questions
  	exam_id = params[:exam_id]
  	subject_id = params[:subject_id]
  	topic_id = params[:topic_id]
  	chapter_id = params[:chapter_id]

  	if exam_id
  		exam = Exam.find(exam_id.to_i)
  		questions = exam.questions
  	end

  	questions.all.each do |question|
      question.answers.each do |answer|
  		  User.first.quiz.create(question: question, answer: answer)
      end
    end

  end
end
