class MediasController < ApplicationController
  def index
    if params[:query].present?
      @medias = Media.all.select do |media|
        media.tag_list.include?(params[:query].downsize)
      end
    end
  end

  def show
  end
end
