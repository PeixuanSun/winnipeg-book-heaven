class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:title, :author, :description, :price, :stock)
    end

end
