class Api::ProductsController < ApplicationController
  def all
    @all_products = Product.all
    render "all_products.json.jb"
  end

  def one
    @product_one = Product.first
    render "product_one.json.jb"
  end

  def two
    @product_two = Product.find_by(id: 2)
    render "product_two.json.jb"
  end

  def three
    @product_three = Product.first
    render "product_three.json.jb"
  end
end
