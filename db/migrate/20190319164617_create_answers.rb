class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :option, null: false
      t.boolean :is_correct, null: false, default: false
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
