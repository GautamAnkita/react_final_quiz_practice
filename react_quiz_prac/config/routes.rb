Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    # /api...
    namespace :v1 do
      # /api/v1...
      resources :questions do 
        resources :answers, only: [ :destroy, :create ]
      end
        # /api/v1/answers
      resource :session, only: [:create, :destroy]
        # /api/v1/session
      resources :users, only: [] do
          # /api/v1/users/current
          get :current, on: :collection
      end
     
    end
      #  match "*unmatched_route", via: :all, to: "application#not_found"
  end
end
