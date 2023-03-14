class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      supplier_id: params[:supplier_id],
      description: params[:description],
    )
    if @product.save
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      supplier_id: params[:supplier_id] || @product.supplier_id,
      description: params[:description] || @product.description,
    )

    if @product.valid?
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: { message: "Product Deleted Successfully!" }
  end
end
