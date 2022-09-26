Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/create'
  get 'articles/new'
  get 'articles/destroy'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
   root  'welcome#home'

   get 'join', to: 'groups#join'
   resources :users do
      

   end

   resources :groups

   resources :articles

   
end
