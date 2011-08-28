Accounts::Application.routes.draw do
  resources :contacts, :categories

  # Temporary root 'til I come up with a better idea.
  root :to => 'contacts#index'
end
