class MediasController < ApplicationController
  def index
    @medias = Media.all
  end

  def show
  end
end
