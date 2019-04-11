class AddUserColumnToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_reference :quizz, :user, foreign_key: true
  end
end
