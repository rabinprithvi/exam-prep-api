class Exam < ApplicationRecord
	has_many :subjects
	has_many :questions, through: :subjects
	validates_presence_of :name
end
