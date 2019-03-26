# Rails API application 

An adaptive learning portal for students to practice questions relevant to an
exam.

Dependencies:

* Ruby 2.3

* Rails 5.0

* SQLite3 

* RSpec 3.6

## Specifications

The hierarchy of how an exam branches out into subjects, topics, chapters and questions is as below :

EXAM—> SUBJECTS—> TOPICS—> CHAPTERS—> QUESTIONS

Exam has many subjects. Subject has many topics. Topic has many chapters. And Chapter has many questions. Questions can be either of Easy, Medium or Hard category. A Question will have 4 answer options and a skip option too. User can either choose from the 4 options or can even skip the question. A user can start answering the questions in any particular chapter. Once a question has been answered
by a user, the user cannot re-answer it.


## API URLs

* An API to show a list of random questions to this user, from within a chapter or topic or subject or Exam. The response should not list questions the user has already answered. If user has answered all questions, then show the questions the user has skipped.

e.g., http://localhost:3000/chapters/1/quiz, http://localhost:3000/subjects/1/quiz

* An API to answer a particular question.

e.g., curl -X PATCH http://localhost:3000/quiz/:quiz_id.json?response=:answer_id

* An API which gives us the user’s percentage of correct answers, wrong answers, skipped questions and unseen questions within a chapter, within a topic, within a subject and within an exam.

e.g., http://localhost:3000/topics/2/score, http://localhost:3000/exams/3/score

### App Initialization

Run bin/rake db:seed to load the test data 

No authentication is required as there is no User model for this sample app.


