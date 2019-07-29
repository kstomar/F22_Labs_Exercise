Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, as: nil, defaults: { format: 'json' } do
    namespace :v1, as: nil do
      resources :questions, only: [:index]  do
        get :result, on: :collection
      end
      resources :exams
      resources :answers, only: [:create]
    end
  end
end
