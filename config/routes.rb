Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: 'login', sign_out:'logout', sign_up:'register'}
  resources :folios, except: [:show]
  get 'folio/:id', to: "folios#show", as: "folio_show"
  get 'angular-items', to: "folios#angular"

  get 'about', to: "pages#about"
  get 'contact', to: "pages#contact"
  resources :blogs
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
