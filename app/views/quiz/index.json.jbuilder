json.questions @quiz do|quiz|
 json.quiz_id quiz.id
 json.question quiz.question.question
  json.options quiz.question.answers do|answer|
    json.option answer.option
  end
end
