class Subject < ApplicationRecord
  belongs_to :exam
  has_many :topics
  has_many :questions, through: :topics
  validates_presence_of :name, :exam
end

