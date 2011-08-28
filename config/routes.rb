Accounts::Application.routes.draw do
  resources :contacts, :categories

  [:purchase_invoices, :purchase_credit_notes, :sales_invoices, :sales_credit_notes].each do |invoice_type|
    resources invoice_type do
      resources :line_items, :only => [ :new ]
    end
  end

  resources :line_items

  # Temporary root 'til I come up with a better idea.
  root :to => 'purchase_invoices#index'
end
