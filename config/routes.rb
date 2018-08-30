Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations'}, :path_prefix => 'devise'
  resources :users do
    resources :events
  end

  root 'dashboard#index'
  match "*path", to: "application#index", via: :all
end
