Rails.application.routes.draw do
  resources :user do
    resources :tax
  end
end