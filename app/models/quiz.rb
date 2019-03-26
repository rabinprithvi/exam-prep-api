class Quiz < ApplicationRecord
  
  self.table_name =  'quizz'

  # If user is implemented, quiz should also belong to user
  belongs_to :question

  scope :answered, -> { where( is_skipped: false ) }
  scope :skipped, -> { where( is_skipped: true ) }

  scope :responded, -> { where.not( response:  nil ) }
  scope :unresponded, -> { where( response:  nil ) }

  scope :correct, -> { answered.where( is_correct: true ) }
  scope :wrong, -> { answered.where( is_correct: false ) }
end
