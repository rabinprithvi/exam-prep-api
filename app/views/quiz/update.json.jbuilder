json.partial! 'shared/success'
json.quiz do
  json.quiz_id @quiz.id
  json.is_correct @quiz.is_correct
end


