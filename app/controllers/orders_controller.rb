class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    subtotal = 0
    tax = 0
    total = 0
    @order = Order.new(
      user_id: current_user.id,
      product_id: parmas[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total,

    )
    if @order.save
      render json: @order.as_json
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render json: @order.as_json
  end

  def index
    @orders = Order.all
    render json: @order.as_json
  end
end
