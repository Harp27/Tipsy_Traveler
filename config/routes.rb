Rails.application.routes.draw do
  
  root 'welcome#index' 

 

  # About Page
  get '/about', to: 'about_page#about'

  # Login Page
  get '/login', to: 'login_page#login'

  # User registration
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end