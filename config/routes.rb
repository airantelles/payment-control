Rails.application.routes.draw do
  root 'customers#index'
  resources :customers
  resources :invoice_types
  resources :invoices
end
