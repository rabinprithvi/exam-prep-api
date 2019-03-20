class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizz do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.boolean :is_selected
      t.boolean :is_correct
      t.boolean :is_skipped

      t.timestamps
    end
  end
end
