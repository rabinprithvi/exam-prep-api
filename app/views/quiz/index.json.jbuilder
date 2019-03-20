json.question @quiz.question.question
json.options @quiz.question.answers do|answer|
  json.option answer.option
end
