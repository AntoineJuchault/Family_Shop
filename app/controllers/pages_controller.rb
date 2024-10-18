class PagesController < ApplicationController
  def home
    @categories = Category.limit(8)
  end

  def about
  end

end
