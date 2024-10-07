class OrdersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_orders, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end
  
  def show
  end

  def new
    @order = current_user.(user: current_user)
  end

  def create 
    @order = Order.new(order_params)
    @order.user = current_user 

    if @order.save 
      redirect_to @order, notice: "Order created"
    else
      render :new
    end

  def edit 
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order Updated"
    else
      render :edit
    end
  end
  
  def destroy 
    @order.destroy
    redirect_to orders_path, notice: "Order deleted"
  end

  private 

  def set_order
    order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
