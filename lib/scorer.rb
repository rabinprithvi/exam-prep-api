class Scorer
  def initialize(level)
    @level = level
  end

	def score
    correct_answers = quiz.correct.count.percent_of quiz_count
    wrong_answers = quiz.wrong.count.percent_of quiz_count
    skipped_questions = quiz.skipped.count.percent_of quiz_count 
    unseen_questions = quiz.unresponded.count.percent_of  quiz_count

    { correct_answers: correct_answers,
      wrong_answers: wrong_answers,
      skipped_questions: skipped_questions,
      unseen_questions: unseen_questions }
  end

  private

  def quiz
    @quiz ||= level_quiz
  end

  def level_quiz
    questions = @level.questions.pluck(:id)
    @quiz = Quiz.where(question_id: questions)
  end

  def quiz_count
    @quiz.count
  end
end

class Fixnum
  def percent_of(n)
    (self.to_f / n.to_f * 100.0).round
  end
end
