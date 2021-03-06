Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations'}, :path_prefix => 'devise'
  resources :users do 
    get :fetch_hours
  end
  
  root 'dashboard#index'
  match "*path", to: "application#index", via: :all
end
