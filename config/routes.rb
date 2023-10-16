Rails.application.routes.draw do
  resources :customers
  resources :invoice_types
  resources :invoices
end
