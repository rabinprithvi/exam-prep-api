class Question < ApplicationRecord
  belongs_to :chapter
  has_many :answers
  validates_presence_of :question, :chapter, :category_type

  enum category_type: [:easy, :medium, :hard]
end
