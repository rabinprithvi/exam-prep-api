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

  def update
    quiz = Quiz.find(params[:id])
    response = Answer.find(params[:response])
    is_skipped = response.option == 'Skip'
    is_correct = response.is_correct unless is_skipped
    
    quiz.update(response: response.id,
                is_correct: is_correct,
                is_skipped: is_skipped)
  end
end
