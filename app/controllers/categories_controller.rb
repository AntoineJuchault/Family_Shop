class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category was created"
    else
      render :new 
    end
  end

  def update
    if @category.update(actegory_params)
      redirect_to @category, notice: "Category updated"
    else 
      render :edit
    end
  end
  
  def destroy 
    @category.destroy 
    redirect_to categories_url, notice: "Category destroyed"
  end
  
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description, :image)
  end
  
   
end
