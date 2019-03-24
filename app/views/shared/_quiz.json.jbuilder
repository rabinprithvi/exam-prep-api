json.partial! 'shared/success'
json.quiz @quiz do|quiz|
 json.quiz_id quiz.id
 json.question quiz.question.question
  json.options quiz.question.answers.shuffle do|answer|
    json.answer_id answer.id
    json.option answer.option
  end
end
