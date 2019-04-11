class AddColumnUserToPracticeLevel < ActiveRecord::Migration[5.0]
  def change
    add_reference :practice_levels, :user, foreign_key: true
  end
end
