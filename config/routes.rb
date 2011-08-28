Accounts::Application.routes.draw do
  resources :contacts, :categories

  resources :purchase_invoices do
    resources :line_items, :only => [ :new ]
  end

  resources :line_items

  # Temporary root 'til I come up with a better idea.
  root :to => 'purchase_invoices#index'
end
