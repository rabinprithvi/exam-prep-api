class ChaptersController <  ApplicationController
	def quiz
    @chapter = Chapter.find(params[:id])
    @quiz = quiz_picker.unissued_quiz 
    @quiz = quiz_picker.skipped_quiz if @quiz.empty?
    render partial: 'shared/quiz'
  end

  def score
    @chapter = Chapter.find(params[:id])
    @score = scorer.score
    render 'shared/score'
  end

  private

  def quiz_picker
    @quiz_picker ||= QuizPicker.new(@chapter)
  end

  def scorer
    @scorer = Scorer.new(@chapter)
  end
end
