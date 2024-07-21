class ProductsController < ApplicationController
  before_action :set_production, only: [:show]

  def index
    @products = Product.order(:title).page(params[:page]).per(20)
  end

  def show;end

  private

  def product_params
    params.require(:product).permit(:title, :author, :description, :price, :stock)
  end

  def set_production
    @product = Product.find(params[:id])
  end
end
