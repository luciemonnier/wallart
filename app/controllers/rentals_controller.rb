class RentalsController < ApplicationController
  def index
    current_user.package.medias.each do |rental|
      unless Rental.find_by(user: current_user, media: rental)
        new_rental = Rental.new(user: current_user, media: rental, active: false)
        authorize new_rental
        new_rental.save
      end
    end
    @active_rentals = policy_scope(Rental).where(user: current_user)
    # @former_rentals = policy_scope(Rental).where(active: false)
    # @uploads = Upload.where(user: current_user)
  end

  def create
    @rental = Rental.new(params_rental)
    authorize @rental
    @rental.active = true
    redirect_to rentals_path if @rental.save
  end

  def update
    @rental = Rental.find(params[:id])
    @upload = Upload.new
    authorize @rental
    # if params[:active] == "false"
    #   @rental.active = false
    #   @rental.display = false
    #   @rental.display = false
    # end
    if params[:display] == "true"
      Rental.where(user: current_user, display: true).each do |rental|
        rental.display = false
        rental.save
      end
      @rental.display = true
      @is_rental = true
      # Upload.where(user: current_user, display: true).each do |upload|
      #   upload.display = false
      #   upload.save
      # end
    end
    @rental.save
    broadcast_rental(@rental, @upload)
    redirect_to rentals_path
  end

  def display
    # @upload = Upload.where(user: current_user, display: true).first
    # if Rental.where(user: current_user, display: true).first.nil? && !@upload.nil?
    #   @rental = Rental.new
    #   @url = @upload.photo
    #   @is_rental = false
    #   @category = "Upload"
    if Rental.where(user: current_user, display: true).first.nil? #remplacer par elsif si upload nécessaire
      @rental = Rental.new
      @url = 'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1553093701/mznyifv2lxjyub3ja7hy.jpg'
      @is_rental = nil
      @category = "Photographie"
    else #!Rental.where(user: current_user, display: true).first.nil?
      @rental = Rental.where(user: current_user, display: true).first
      @url = @rental.media.photos.first.url
      @is_rental = true
      @category = @rental.media.category.name
    end
    authorize @rental
  end

  def broadcast_rental(rental, upload)
    ActionCable.server.broadcast("user_#{current_user.id}", {
      media_partial: ApplicationController.renderer.render(
        partial: "shared/media",
        locals: hash_locals(rental, upload)
      )
    })
  end

  private

  def params_rental
    params.require(:rental).permit(:media_id, :user_id)
  end

  def hash_locals(rental, upload)
    if @is_rental == nil
      { url: 'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1553093701/mznyifv2lxjyub3ja7hy.jpg', category: "Photographie", rental: false }
    elsif @is_rental
      { url: rental.media.photos.first.url, category: rental.media.category.name, rental: true }
    else
      { url: upload.photo, category: "Upload", rental: false }
    end
  end
end
