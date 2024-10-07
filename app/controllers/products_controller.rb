class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_for_categories, only: [:new, :create]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params) 
    if @product.save
      redirect_to @product, notice: "Product created"
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated"
    else
      render :edit 
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product destroyed"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def check_for_categories
    if Category.count == 0
      redirect_to categories_path, alert: "Add category to product"
    end
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id, :image)
  end
end

