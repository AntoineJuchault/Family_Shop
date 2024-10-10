class ApplicationController < ActionController::Base
  helper_method :current_order, :current_order_total_price

  def current_order
    if user_signed_in?
      Order.find_or_create_by(user: current_user, status: "pending")
    else
      nil
    end
  end

  def current_order_total_price
    return 0 unless current_order.present?
    current_order.order_items.joins(:product).sum("order_items.quantity * products.price")
  end
end

