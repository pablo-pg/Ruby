Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get '/products', to: 'products#index'  # Cuando alguien vaya a /products ejecutara el metodo index del controlador products
  get 'products/:id', to: 'products#show', as: :product
end
