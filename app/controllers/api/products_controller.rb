class Api::ProductsController < ApplicationController
  def all
    @all_products = Product.all
    render "all_products.json.jb"
  end
end
