class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    # product_id =
    # products = Product.find(product_id)

    carted_products = CartedProduct.where(id: current_user.id)
    carted_products.map do |product|
      if product.status == "carted"
        calculated_subtotal = product.product.price * product.product.quantity
        calculated_tax = calculated_subtotal * 0.09
        calculated_total = calculated_subtotal + calculated_tax

        @order = Order.new(
          user_id: current_user.id,
          subtotal: calculated_subtotal,
          tax: calculated_tax,
          total: calculated_total,
        )
        @order.save
        render "show.json.jb"
      end
    end

    # @order = Order.new(
    #   user_id: current_user.id,
    #   product_id: product_id,
    #   quantity: order.quantity,
    #   subtotal: calculated_subtotal,
    #   tax: calculated_tax,
    #   total: calculated_total,
    #   status: order.status == "carted",
    # )

  end

  def show
    order_id = params[:id]
    @order = current_user.orders.find(order_id)
    render "show.json.jb"
  end
end
