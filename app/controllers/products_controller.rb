class ProductsController < ApplicationController
  before_action :set_production, only: [:show]

  def index
    @products = Product.order(:title).page(params[:page]).per(20)
  end

  def show
    add_breadcrumb "Home", :root_path
    add_breadcrumb @product.id
    add_breadcrumb @product.title
  end

  def search
    @products = Product.order(:title)

    @products = @products.ransack(title_or_description_cont: params[:query]).result if params[:query].present?

    if params[:c_id].present?
      category = Category.find(params[:c_id])
      @products = @products.joins(:categories).where(categories: { id: category.id })
    end

    @products = @products.page(params[:page]).per(20)

    render :index
  end

  private

  def product_params
    params.require(:product).permit(:title, :author, :description, :price, :stock)
  end

  def set_production
    @product = Product.find(params[:id])
  end
end
