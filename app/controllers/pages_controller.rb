class PagesController < ApplicationController
  def home
    @categories = Category.limit(4)
  end

  def about
  end

end
