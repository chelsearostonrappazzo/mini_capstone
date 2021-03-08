class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = Recipe.where("name ILIKE ?", "*#{params[:search]}*")
    end
    @products = @products.order(price: :asc)
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
      description: params[:description],
      quantity: params[:quantity],
      supplier_id: params[:supplier_id],
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
    @product.description = params[:description] || @product.description
    @product.quantity = params[:quantity] || @product.quantity
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

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
