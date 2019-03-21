class ArtistsController < ApplicationController
  def index
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist
  end
end
