class Chapter < ApplicationRecord
  belongs_to :topic
  has_many :questions
  validates_presence_of :name, :topic
  has_one :practice_level

  def eligible_for_next_level?
  	chapter_level = practice_level.progress_level
  	total_questions = questions.where(category_type: chapter_level)
  	correctly_answered = Quiz.where( question: total_questions )
  							             .where(is_correct: true)

  	correctly_answered.count.percent_of(total_questions.count) >= 50
  end

  def progress_to_next_level
  	practice_level.move_next_level
  end 
end

class Fixnum
  def percent_of(n)
    (self.to_f / n.to_f * 100.0).round
  end
end
