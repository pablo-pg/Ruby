Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get 'products/new', to: 'products#new', as: :new_product # El as es un helper para que luego no tengamos que poner la url sino el alias
  get '/products', to: 'products#index'  # Cuando alguien vaya a /products ejecutara el metodo index del controlador products
  get 'products/:id', to: 'products#show', as: :product
end
