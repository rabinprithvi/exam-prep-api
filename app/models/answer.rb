class Answer < ApplicationRecord
  belongs_to :question
  validates_presence_of :option, :question

end
