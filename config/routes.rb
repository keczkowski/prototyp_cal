Rails.application.routes.draw do
  resources :additional_services
  resources :payments
  resources :domains
  resources :servers
  resources :packages
  resources :users

  devise_for :users, path: 'auth', path_names: { sign_in: 'login',
                                               sign_out: 'logout',
                                               password: 'secret',
                                               confirmation: 'verification',
                                               unlock: 'unblock',
                                               registration: 'register',
                                               sign_up: 'signup' }

  get "home/index"
  get "oferty", to: 'home#oferty', as: "oferty"
  get "domeny", to: 'home#user_domains', as: "user_domains"
  get "platnosci", to: 'home#user_payments', as: "user_payments"
  get "additional_services_list", to: 'home#additional_services_list', as: "additional_services_list"
  get "server_list", to: 'home#server_list', as: "server_list"
  get "new_user_server", to: 'home#new_user_server', as: "new_user_server"
  get "zarzadzanie_serwerem/:id", to: 'home#user_server_settings', as: "user_server_settings"
  post 'create_user_server', to: 'home#create_user_server', as: 'create_user_server'
  root to: 'home#index'

end
