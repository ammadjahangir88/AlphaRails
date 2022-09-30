Rails.application.routes.draw do

  devise_for :users 

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#home'


   
 
  
   resources :users do
  
     resources :groups do 
    
      resources :articles do 
        
      end
     
      get 'join', to: 'groups#join'
      get 'joingroup', to: 'groups#joingroup'
      get 'view', to: 'groups#view'
      get 'approve', to: 'groups#approve'
      get 'accept', to: 'groups#accept'
      get 'delete', to: 'groups#delete'
    end
   end
 

   resources  :users do
    resources :articles  do
     
    end
  end
    
   

   
end
