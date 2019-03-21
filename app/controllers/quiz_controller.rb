class QuizController < ApplicationController
  def index
  	questions = Exam.find(params[:exam_id]).questions if params[:exam_id]
    questions = Subject.find(params[:topic_id]).questions if params[:subject_id]
    questions = Topic.find(params[:subject_id]).questions if params[:topic_id]
    questions = Chapter.find(params[:chapter_id]).questions if params[:chapter_id]

  	@quiz = questions.map do |question|
  		  User.first.quiz.create(question: question)
    end
  end
end
