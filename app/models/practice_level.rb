class PracticeLevel < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  
  enum level: [:easy, :medium, :hard]

  def progress_level
  	level
  end

  def move_next_level
  	update(level: next_level)
  end

  private

  def next_level
  	easy?  ? 'medium' : 'hard'
  end
end
