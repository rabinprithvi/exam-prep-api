class CreatePracticeLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :practice_levels do |t|
      t.references :chapter, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
