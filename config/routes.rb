Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end
  # root 'apipie_apipie_path(v1)'
end
