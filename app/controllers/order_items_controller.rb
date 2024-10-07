class OrderItemsController < ApplicationController

  before_action :set_order
  before_action :authenticate_user!

  def create 
    @product = Product.find(params[:product_id])
    @order_items = order.order_items.find_or_initialize_by(product: product)

    if @order_item.new.record?
       @order_item.quantity == 1
    else 
      @order_items.quantity += 1
    end
  
    if @order_items.save
      redirect_to @order, notice: "Product add to order"
    else 
      redirect_to products_path, alert: "Could not add product"
    end
  end
  
  def update
     @order_items = @order.order_items.find(params[:id])
     if @order_item.update(order_item_params)
        redirect_to @order, notice: "Order item update"
     else
      render :edit
    end
  end

  def destroy 
    @orders_item = @order.order.items.find(params[:id])
    @order_items.destroy 
    redirect_to @order, notice: "Order tems removed"
  end

  private


  def set_order
    @order = current_user.orders.find_or_create_by(status: "pending")
  end

  def order_items_params
    params.require(:orders_item).permit(:quatity, :product_id)
  end

end
