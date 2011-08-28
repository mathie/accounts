Accounts::Application.routes.draw do
  resources :contacts, :categories, :purchase_invoices

  # Temporary root 'til I come up with a better idea.
  root :to => 'purchase_invoices#index'
end
