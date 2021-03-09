class Api::OrdersController < ApplicationController
  def create
    if current_user
      @order = Order.new(
        user_id: current_user,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: 
      )
      @order.save
      render json: { message: "Order submitted!" }
    else
      render json: { error: "You must be logged in to submit an order!" }
    end
  end
end
