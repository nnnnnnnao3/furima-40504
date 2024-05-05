Rails.application.routes.draw do
  root to: 'items#index'
<<<<<<< Updated upstream
=======
  resources :items, only: [:index, :new, :create]
>>>>>>> Stashed changes
end
