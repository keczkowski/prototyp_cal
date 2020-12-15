Rails.application.routes.draw do
  resources :additional_services
  resources :payments
  resources :domains
  resources :servers
  resources :packages
  resources :users
  resources :u_ftps
  resources :u_dbs
  resources :u_emails
  resources :dns_records
  resources :u_cases, only: [:create, :update, :destroy]

  devise_for :users, path: 'auth', path_names: { sign_in: 'login',
                                               sign_out: 'logout',
                                               password: 'secret',
                                               confirmation: 'verification',
                                               unlock: 'unblock',
                                               registration: 'register',
                                               sign_up: 'signup' }

  get "home/index"
  get "search/(:q)", to: "home#search", as: "search"
  get "program_partnerski", to: "home#program_partnerski", as: "program_partnerski"
  get "oferty", to: 'home#oferty', as: "oferty"
  get "domeny", to: 'home#user_domains', as: "user_domains"
  get "domeny/:id", to: 'home#user_domain', as: "user_domain"
  get "platnosci", to: 'home#user_payments', as: "user_payments"
  get "zgloszenia", to: 'home#user_u_cases', as: "user_u_cases"
  get "additional_services_list", to: 'home#additional_services_list', as: "additional_services_list"
  get "server_list", to: 'home#server_list', as: "server_list"
  get "new_user_server", to: 'home#new_user_server', as: "new_user_server"
  get "zarzadzanie_serwerem/:id", to: 'home#user_server_settings', as: "user_server_settings"
  get "zarzadzanie_serwerem/:id/ftp", to: 'home#user_server_settings_ftp', as: "user_server_settings_ftp"
  get "zarzadzanie_serwerem/:id/db", to: 'home#user_server_settings_db', as: "user_server_settings_db"
  get "zarzadzanie_serwerem/:id/domain", to: 'home#user_server_settings_domain', as: "user_server_settings_domain"
  get "zarzadzanie_serwerem/:id/email", to: 'home#user_server_settings_email', as: "user_server_settings_email"
  post 'create_user_server', to: 'home#create_user_server', as: 'create_user_server'
  root to: 'home#index'

end
