class MediasController < ApplicationController
  def index
    @categories = Category.all
    if params[:query].present?
      @medias = policy_scope(Media).search_by_title_category_and_description(params[:query])
      @medias = @medias.to_a
      scope(Media).each do |media|
        if media.tags.any? { |tag| tag.name.match(/#{params[:query].downcase}/) }
          @medias << media
        end
      end
    else
      @medias = policy_scope(Media)
    end
    return @medias
  end

  def show
    @media = Media.find(params[:id])
    authorize @media
    @rental = Rental.new(media: @media, user: current_user)
  end
end
