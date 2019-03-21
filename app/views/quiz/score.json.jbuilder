json.score do
 json.correct_answers @correct_answers.to_s + '%'
 json.wrong_answers @wrong_answers.to_s + '%'
 json.skipped_questions @skipped_questions.to_s + '%'
 json.unseen_questions @unseen_questions.to_s + '%'
end
