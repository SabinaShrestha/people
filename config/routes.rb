Rails.application.routes.draw do
  get 'children/index'
  get 'children/show'
  get 'children/new'
  get 'children/edit'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :people do
    resources :children
  end
end
