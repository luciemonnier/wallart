class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
    @medias = Media.where(category: @category)
  end
end
