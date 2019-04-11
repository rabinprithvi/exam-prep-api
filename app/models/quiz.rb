class Quiz < ApplicationRecord
  
  self.table_name =  'quizz'

  # If user is implemented, quiz should also belong to user
  belongs_to :question
  belongs_to :user

  scope :answered, -> { where( is_skipped: false ) }
  scope :skipped, -> { where( is_skipped: true ) }

  scope :responded, -> { where.not( response:  nil ) }
  scope :unresponded, -> { where( response:  nil ) }

  scope :correct, -> { answered.where( is_correct: true ) }
  scope :wrong, -> { answered.where( is_correct: false ) }

  after_update :check_practice_level, if: :response_changed?

  private

  def check_practice_level
  	chapter = question.chapter
  	chapter.progress_to_next_level if chapter.eligible_for_next_level?
  end
end
