Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      # resource :products
      resources :vendors do
        resources :products
      end
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
