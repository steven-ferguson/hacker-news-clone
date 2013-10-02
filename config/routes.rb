HackerNews::Application.routes.draw do
  resources :links 
  resources :votes
  resources :comments

  root to: 'links#index'
end
