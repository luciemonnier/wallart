class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @category = Category.find(params[:id])
    authorize @category
    @medias = Media.where(category: @category).select { |media| media.subscription_type.level <= current_user.subscription_type.level }
  end
end
