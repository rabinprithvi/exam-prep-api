class Chapter < ApplicationRecord
  belongs_to :topic
  has_many :questions
  validates_presence_of :name, :topic
end
