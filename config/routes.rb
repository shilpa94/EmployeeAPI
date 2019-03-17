Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end

  resources :leave_requests do
    post :approve, on: :member
    post :reject, on: :member
  end
  # root 'apipie_apipie_path(v1)'
end
