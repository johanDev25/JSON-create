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
   render json: { errors: @products.errors }, status: 422
 end
  end

  private
  def produc_params
    params.require(:article).permit(:name, :price)
  end
end
