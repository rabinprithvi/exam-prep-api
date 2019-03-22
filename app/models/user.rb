class User < ApplicationRecord
  has_many :quizz, class_name: Quiz
end
