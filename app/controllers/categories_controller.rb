class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    authorize @category
    @medias = Media.where(category: @category, portrait: false)
  end

  def portrait
    @categories = policy_scope(Category)
    @category = Category.find(params[:category_id])
    authorize @category
    @medias = Media.where(category: @category, portrait: true)
  end
end
