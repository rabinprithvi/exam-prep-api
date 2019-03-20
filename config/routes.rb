Rails.application.routes.draw do
  get 'exams/:exam_id/quizz', to: 'quiz#index'
  get 'exams/:exam_id/subjects/:subject_id/quizz', to: 'quiz#index'
end
# Enpoints

# API to show a list of random questions to this user, from within a chapter or topic or
# subject or Exam.

# GET /exams/id/quizz
# GET /examss/id/subjects/id/quizz
# GET /exam/id/subjects/id/topics/id/quizz
# GET /exams/id/subjects/id/topics/id/chapter/id/quizz

# API to answer question
# PATCH /quizz/id/update => CREATE => user_id, question_id, answer_id, right_answer, skipped

# API to display progress within exam / subject / topic / chapter
# % of correct answers
# % of wrong answers
# % of skipped questions
# % of unseen questions

# GET /exams/id/progress_card
# GET /exams/id/subjectss/id/progress_card
# GET /exams/id/subject/id/topics/id/progress_card
# GET /exams/id/subjects/id/topics/id/chapters/id/progress_card


