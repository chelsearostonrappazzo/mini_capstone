class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    input = params[:id]
    @product = Product.find(input)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      quantity: params[:quantity],
    )

    #happy/sad path
    if @product.save
      render "show.json.jb"
    else
      render json: { message: @product.errors.full_messages }, status: 406
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.quantity = params[:quantity] || @product.quantity

    #happy/sad path
    if @product.save
      render "show.json.jb"
    else
      render json: { message: @product.errors.full_messages }, status: 406
    end
  end

  def delete
    product_id = params[:id]
    product = Product.find(product_id)
    product.destroy
    render json: { message: "Product deleted successfully!" }
  end
end
