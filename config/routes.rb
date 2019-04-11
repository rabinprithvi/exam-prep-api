Rails.application.routes.draw do
  concern :quizzable do
    member do
      get 'quiz'
      get 'score'
    end
  end

  # For now, User will take quizz at chapter level and move
  # from easy to hard questions
  resources :chapters, concerns: :quizzable, only: [], defaults: { format: :json }
  resources :quiz, only: [:update], defaults: { format: :json }

  # resources :topics, concerns: :quizzable, only: [], defaults: { format: :json }
  # resources :subjects, concerns: :quizzable, only: [], defaults: { format: :json }
  # resources :exams, concerns: :quizzable, only: [], defaults: { format: :json }
  
end
