class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total,

    )
    if @order.save
      render template: "orders/show"
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    order_id = params[:id]
    @order = current_user.orders.find_by(id: order_id)
    render template: "orders/show"
  end

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end
end
