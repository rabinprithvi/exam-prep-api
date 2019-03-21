class QuizController < ApplicationController
  def index
  	questions = Exam.find(params[:exam_id]).questions if params[:exam_id]
    questions = Subject.find(params[:topic_id]).questions if params[:subject_id]
    questions = Topic.find(params[:subject_id]).questions if params[:topic_id]
    questions = Chapter.find(params[:chapter_id]).questions if params[:chapter_id]
    
    issued_question_ids = Quiz.where.not(response: nil).pluck(:question_id) 
    issued_questions = Question.where(id: issued_question_ids) 
    questions = questions - issued_questions 

  	@quiz = questions.shuffle.map do |question|
  		  User.first.quiz.find_or_create_by(question: question)
    end
    @quiz = User.first.quiz.where(is_skipped: true).shuffle if @quiz.empty?
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
