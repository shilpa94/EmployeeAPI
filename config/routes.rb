Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'employees#index'
end
