Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root "application#hello"
  
  root "pages#home"
  
  get '/about', to: 'pages#about'
  
  get '/help', to: 'pages#help'
  
  get 'todos/index', to: 'todos#index'

  resource :todos
  
end
