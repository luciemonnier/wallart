class MediasController < ApplicationController
  def index
    @categories = ["vidéo", "cinémagraphe", "photo numérique", "algorithme", "illustration", "peinture numérique"]
    if params[:query].present?
      @medias = Media.search_by_title_category_and_description(params[:query])
    else
      @medias = Media.all
    end
  end

  def show
  end
end
