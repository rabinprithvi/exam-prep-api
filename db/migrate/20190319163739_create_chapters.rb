class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :name, null: false
      t.references :topic, foreign_key: true, null: false

      t.timestamps
    end
  end
end
