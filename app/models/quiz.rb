class Quiz < ApplicationRecord
  self.table_name =  'quizz'

  belongs_to :user
  belongs_to :question
end
