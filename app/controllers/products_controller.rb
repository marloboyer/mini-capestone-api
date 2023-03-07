class ProductsController < ApplicationController
  def index
    product = Prodcut.all
    render json: product.as_json
  end

  def show
    product_id = params[:id]
    product = Prodcut.find_by(id: product_id)
    render json: product.as_json
  end

  def create
    product = Prodcut.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    if product.save
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product_id = params[:id]
    product = Prodcut.find(product_id)
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price,
      image_url: params[:image_url] || product.image_url,
      description: params[:description] || product.description,
    )

    if product.valid?
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params[:id]
    product = Prodcut.find(product_id)
    product.destroy
    render json: { message: "Product Deleted Successfully!" }
  end
end
