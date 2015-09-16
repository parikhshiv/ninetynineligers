Rails.application.routes.draw do
  root to: "ligers#index"
  resources :ligers
  resources :liger_rental_requests
  get 'liger_rental_requests/:id/approve' => 'liger_rental_requests#approve', as: 'approve'
  get 'liger_rental_requests/:id/deny' => 'liger_rental_requests#deny', as: 'deny'
end
