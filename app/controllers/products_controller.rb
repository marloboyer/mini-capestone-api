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
end
