Rails.application.routes.draw do
  
namespace :api do 
  namespace :v1 do 
    resources :categories do
      resources :inventories do
        resources :ingredients
      end
    end
  
    resources :tables do 
      resources :orders do 
        resources :items
      end
    end

    scope :format => true, :constraints => { :format => 'json' } do
      post   "/user"        => "users#create"
      post   "/login"       => "sessions#create"
      delete "/logout"      => "sessions#destroy"
    end
  end
end

  
end