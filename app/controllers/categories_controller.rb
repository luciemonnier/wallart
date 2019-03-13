class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @medias = Media.where(category: @category)
  end
end
