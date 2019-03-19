class RentalsController < ApplicationController
  def index
    @active_rentals = policy_scope(Rental).where(active: true)
    @former_rentals = policy_scope(Rental).where(active: false)
    @uploads = Upload.where(user: current_user)
  end

  def create
    @rental = Rental.new(params_rental)
    authorize @rental
    @rental.active = true
    if @rental.save
      redirect_to rentals_path
    end
  end

  def update
    @rental = Rental.find(params[:id])
    authorize @rental
    if params[:active] == "false"
      @rental.active = false
      @rental.display = false
    end
    if params[:display] == "true"
      Rental.where(user: current_user, display: true).each do |rental|
        rental.display = false
        rental.save
      end
      @rental.display = true
    end
    @rental.save
    broadcast_rental(@rental)
    #ActionCable.server.broadcast("user_#{current_user.id}", { image: @rental.media.photos.first.url })
    redirect_to rentals_path
  end

  def display
    @upload = Upload.where(user: current_user, display: true).first
    if Rental.where(user: current_user, display: true).first == nil
      @rental = Rental.new
      @url = @upload.photo
      @is_rental = false
      @category = "Photographie"
    else
      @rental = Rental.where(user: current_user, display: true).first
      @url = @rental.media.photos.first.url
      @is_rental = true
      @category = @rental.media.category.name
    end
    authorize @rental
  end

  def broadcast_rental(rental)
    ActionCable.server.broadcast("user_#{current_user.id}", {
      media_partial: ApplicationController.renderer.render(
        partial: "shared/media",
        locals: { url: rental.media.photos.first.url, category: rental.media.category.name, rental: true }
      )
    })
  end

  private

  def params_rental
    params.require(:rental).permit(:media_id, :user_id)
  end
end
