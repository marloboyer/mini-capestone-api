Rails.application.routes.draw do
  get "/products" => "products#index"

  get "/products/:id" => "products#show"

  post "/recipes" => "recipes#create"
end
