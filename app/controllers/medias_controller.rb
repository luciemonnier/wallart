class MediasController < ApplicationController
  def index
    if params[:query].present?
      @medias = Media.all.select do |media|
        media.tag_list.include?(params[:query].downsize)
      end
      Media.search_by_title_and_description(params[:query]).each do |media|
        @medias << media
      end
    else
      @medias = Media.all
    end
  end

  def show
  end
end
