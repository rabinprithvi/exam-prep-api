class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
  	# add user_id column if User is implemented
    create_table :quizz do |t|
      t.references :question, foreign_key: true, null: false
      t.integer :response
      t.boolean :is_correct
      t.boolean :is_skipped

      t.timestamps
    end
  end
end
