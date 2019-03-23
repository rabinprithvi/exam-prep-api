Rails.application.routes.draw do
  concern :quizzable do
    member do
      get 'quiz'
      get 'score'
    end
  end
  resources :chapters, concerns: :quizzable
  resources :topics, concerns: :quizzable
  resources :subjects, concerns: :quizzable
  resources :exams, concerns: :quizzable
  resources :quiz, only: [:update]
end
