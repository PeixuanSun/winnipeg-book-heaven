class OrdersController < ApplicationController

  private

  def order_params
    params.require(:order).permit(:user_id, :total_price, :status)
  end
end
