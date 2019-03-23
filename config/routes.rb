Rails.application.routes.draw do
  concern :quizzable do
    member do
      get 'quiz'
      get 'score'
    end
  end
  resources :chapters, concerns: :quizzable, only: []
  resources :topics, concerns: :quizzable, only: []
  resources :subjects, concerns: :quizzable, only: []
  resources :exams, concerns: :quizzable, only: []
  resources :quiz, only: [:update]
end
