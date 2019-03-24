Rails.application.routes.draw do
  concern :quizzable do
    member do
      get 'quiz'
      get 'score'
    end
  end

  resources :chapters, concerns: :quizzable, only: [], defaults: { format: :json }
  resources :topics, concerns: :quizzable, only: [], defaults: { format: :json }
  resources :subjects, concerns: :quizzable, only: [], defaults: { format: :json }
  resources :exams, concerns: :quizzable, only: [], defaults: { format: :json }
  resources :quiz, only: [:update], defaults: { format: :json }
  
end
