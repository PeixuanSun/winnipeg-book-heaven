# app/controllers/cart_controller.rb
class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
end
