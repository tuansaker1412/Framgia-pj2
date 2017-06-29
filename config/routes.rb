Rails.application.routes.draw do
  root "static_pages#index"
  get "home", to: "static_pages#home"
  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"
  devise_for :users
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    post "login", to: "devise/sessions#create"
    get "signup", to: "devise/registrations#new"
    post "signup", to: "devise/registrations#create"
    get "edit", to: "devise/registrations#edit"
    put "edit", to: "devise/registrations#update"
  end
end
