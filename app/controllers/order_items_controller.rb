class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def create
    product = Product.find(params[:product_id])
    @order_item = @order.order_items.find_or_initialize_by(product: product)

    # Si @order_item n'a pas de quantité définie, initialiser à 1
    @order_item.quantity = @order_item.quantity.present? ? @order_item.quantity + 1 : 1

    if @order_item.save
      redirect_to order_path(@order), notice: "Produit ajouté au panier"
    else
      redirect_to products_path, alert: "Impossible d'ajouter ce produit au panier"
    end
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to order_path(@order), notice: "Order item updated"
    else
      render :edit
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_to order_path(@order), notice: "Order item removed"
  end

  private

  def set_order
    @order = current_user.orders.find_or_create_by(status: "pending")
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end

