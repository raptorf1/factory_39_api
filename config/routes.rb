Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :quotes, only: %i[create]
    end
  end
end
