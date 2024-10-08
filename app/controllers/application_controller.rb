class ApplicationController < ActionController::Base
  
  helper_method :current_order

  def current_order
    if user_signed_in?
      Order.find_or_create_by(user: current_user, status: "pending")
    else
      nil
    end
  end
end
