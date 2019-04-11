class QuizPicker
	def initialize(level)
		@level = level
	end

	def unissued_quiz
    unissued_questions.shuffle.map do |question|
      Quiz.find_or_create_by(question: question, user: user)
    end
  end

	def skipped_quiz
    Quiz.where(user: user, is_skipped: true).shuffle
  end

  private 

  def unissued_questions    
    all_questions - issued_questions 
  end

  def all_questions
    # For now, user practices at chapter level from easy to hard
    # so here,  @level = chapter record for the route /chapters/[:id]/quiz
    questions = @level.questions.where("category_type <= #{practice_level.level_before_type_cast}")
  end

  def practice_level
    return @level.practice_level if @level.practice_level
    PracticeLevel.create(chapter: @level, level: 0, user: user)
  end

  def issued_questions
    issued_question_ids = Quiz.where.not(response: nil).pluck(:question_id) 
    Question.where(id: issued_question_ids) 
  end

  # For now, we have only one user
  def user
    User.first
  end
end
