class QuizController < ApplicationController
  def index
    @quiz = unissued_quiz 
    @quiz = skipped_quiz if @quiz.empty?
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

  def score
    questions = Exam.find(params[:exam_id]).questions if params[:exam_id]
    questions = Subject.find(params[:topic_id]).questions if params[:subject_id]
    questions = Topic.find(params[:subject_id]).questions if params[:topic_id]
    questions = Chapter.find(params[:chapter_id]).questions if params[:chapter_id]

    issued_questions = user.quiz
    unseen_questions = issued_questions.where(response: nil)
    questions_taken = issued_questions.where(is_skipped: false).where.not(response: nil)
    correct_answers = questions_taken.where(is_correct: true)
    wrong_answers = questions_taken.where(is_correct:false)
    skipped_questions = issued_questions.where(is_skipped: true)

    @correct_answers = correct_answers.count.percent_of issued_questions.count
    @wrong_answers = wrong_answers.count.percent_of issued_questions.count
    @skipped_questions = skipped_questions.count.percent_of issued_questions.count 
    @unseen_questions = unseen_questions.count.percent_of  issued_questions.count
  end

  private

  def unissued_questions    
    all_questions - issued_questions 
  end

  def issued_questions
    issued_question_ids = user.quizz.where.not(response: nil).pluck(:question_id) 
    Question.where(id: issued_question_ids) 
  end

  def all_questions
    questions = Exam.find(params[:exam_id]).questions if params[:exam_id]
    questions = Subject.find(params[:topic_id]).questions if params[:subject_id]
    questions = Topic.find(params[:subject_id]).questions if params[:topic_id]
    questions = Chapter.find(params[:chapter_id]).questions if params[:chapter_id]
  end

  def unissued_quiz
    unissued_questions.shuffle.map do |question|
        user.quizz.find_or_create_by(question: question)
    end
  end

  def skipped_quiz
    User.first.quiz.where(is_skipped: true).shuffle
  end

  def user
    User.first
  end
end

class Fixnum
  def percent_of(n)
    (self.to_f / n.to_f * 100.0).round
  end
end
