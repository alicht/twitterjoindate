Rails.application.routes.draw do
  get 'welcome/search'

  resources :welcome

  root 'welcome#search'
  get '/search', to: 'welcome#search_results'


end
