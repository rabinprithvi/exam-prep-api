class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.integer :category_type, null: false
      t.references :chapter, foreign_key: true, null: false

      t.timestamps
    end
  end
end
