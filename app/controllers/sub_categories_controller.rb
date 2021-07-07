class SubCategoriesController < ApplicationController
  def index
    main_category = MainCategory.find(params[:main_category_id])
    render json: main_category.sub_categories.select(:id, :name)
  end
end
