# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_order

  def current_order
    if session[:order_id]
      order = Order.find(session[:order_id])
      if order.status == "pending"
        return order
      else
        session[:order_id] = nil
      end
    end
    if session[:order_id] == nil
      order = Order.create(status: "pending", user: current_user)
      session[:order_id] = order.id
    end
    return order
  end
end
