class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :category_type
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
