class MediasController < ApplicationController
  def index
    @categories = Category.all
    if params[:query].present?
      @medias = Media.search_by_title_category_and_description(params[:query])
      @medias = @medias.to_a
      Media.all.each do |media|
        if media.tags.any? { |tag| tag.name.match(/#{params[:query].downcase}/) }
          @medias << media
        end
      end
    else
      @medias = Media.all
    end
    return @medias
  end

  def show
    @media = Media.find(params[:id])
    @rental = Rental.new(media: @media, user: current_user)
  end
end
