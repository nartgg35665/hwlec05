Rails.application.routes.draw do
  get 'score/list'
  root to:"main#index"
  get 'main/test'
  get 'main/result'
  post 'main/test'
  post 'score/delete'
  post 'score/edit'
  post 'score/update'
  post 'score/back'
  post 'score/list'
  post 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
