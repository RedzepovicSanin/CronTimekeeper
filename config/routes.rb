Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations'}, :path_prefix => 'devise'
  resources :users do
    resources :events do
      collection do
        post 'generate', to: 'events#generate'
      end
    end
  end
  
  root 'dashboard#index'
  match "*path", to: "application#index", via: :all
end
