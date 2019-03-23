json.partial! 'shared/success'
json.score do
 json.correct_answers @score[:correct_answers].to_s + '%'
 json.wrong_answers @score[:wrong_answers].to_s + '%'
 json.skipped_questions @score[:skipped_questions].to_s + '%'
 json.unseen_questions @score[:unseen_questions].to_s + '%'
end
