class Topic < ApplicationRecord
  belongs_to :subject
  has_many :chapters
  has_many :questions, through: :chapters
  validates_presence_of :name, :subject
end
