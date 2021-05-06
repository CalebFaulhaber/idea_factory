Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # index  - products_path
  # new    - new_product_path
  # edit   - edit_product_path
  # show   - product_path
  # create - n/a
  # update - n/a
  # destroy - n/a

  get '/', to: 'welcome#home', as: 'home'

  # IDEAS
  # index
  get '/ideas', to: 'ideas#index', as: 'ideas'
  # new
  get '/ideas/new', to: 'ideas#new', as: 'new_idea'
  # create
  post '/ideas', to: 'ideas#create'
  # show
  get '/ideas/:id', to: 'ideas#show', as: 'idea'
  # edit
  get '/ideas/:id/edit', to: 'ideas#edit', as: 'edit_idea'
  # update
  patch '/ideas/:id', to: 'ideas#update'
  # delete
  delete '/ideas/:id', to: 'ideas#destroy'





end
