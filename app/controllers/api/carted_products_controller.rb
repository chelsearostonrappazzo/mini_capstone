class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    status = "carted"
    @cart = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: status,
    )
    if @cart.save
      render json: { message: "Let's go the mall!" }, status: :created
    else
      render json: { errors: @cart.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @cart = current_user.carted_products
    render "index.json.jb"
  end
end
