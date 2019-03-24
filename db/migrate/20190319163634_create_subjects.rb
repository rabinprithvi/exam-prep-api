class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.references :exam, foreign_key: true, null: false

      t.timestamps
    end
  end
end
