class CategoriesController < ApplicationController

  def index
    @parents = Category.all.order("id ASC").limit(3)
  end

  def create
  end

  def edit
  end

  def update
  end

end
