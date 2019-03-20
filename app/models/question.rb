class Question < ApplicationRecord
  belongs_to :chapter
  has_many :answers

  enum category_type: [:easy, :medium, :hard]
end
