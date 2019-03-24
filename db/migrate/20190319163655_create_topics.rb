class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.references :subject, foreign_key: true, null: false

      t.timestamps
    end
  end
end
