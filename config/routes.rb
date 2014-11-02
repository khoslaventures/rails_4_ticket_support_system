Rails.application.routes.draw do
  root 'landings#index'
  devise_for :admins
  get 'landings/index'

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]

  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

  get "admin/support_centre" => "pages#supportcentre"

  resources :tickets do
    resources :ticketmessages
  end

  post "new_ticket" => "tickets#new_ticket"
  get '/ticket_close' => 'tickets#close_ticket'
  get '/ticket_open' => 'tickets#open_ticket'

end
