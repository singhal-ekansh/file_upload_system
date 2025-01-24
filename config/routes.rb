Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/documents')
  resources :documents
end
