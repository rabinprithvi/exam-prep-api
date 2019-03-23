class QuizPicker
	def initialize(level)
		@level = level
	end

	def unissued_quiz
    unissued_questions.shuffle.map do |question|
      quiz.find_or_create_by(question: question)
    end
  end

	def skipped_quiz
    quiz.where(is_skipped: true).shuffle
  end

  private 

  def unissued_questions    
    all_questions - issued_questions 
  end

  def all_questions
    questions = @level.questions
  end

  def issued_questions
    issued_question_ids = quiz.where.not(response: nil).pluck(:question_id) 
    Question.where(id: issued_question_ids) 
  end

  def quiz
    Quiz.all
  end
end
