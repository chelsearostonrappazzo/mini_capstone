Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#all"
    get "/product_one" => "products#one"
    get "/product_two" => "products#two"
    get "/product_three" => "products#three"
  end
end
