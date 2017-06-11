Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'reckless_diets#top'

  resources :reckless_diets, only: [:top, :result]
end
