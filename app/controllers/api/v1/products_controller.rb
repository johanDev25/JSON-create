class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      render json: @products, status: 201
    else
      render json:  @products.errors, status: 422
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
