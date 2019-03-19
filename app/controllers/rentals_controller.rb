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
    end
    if params[:display] == "true"
      Rental.where(display: true).each do |rental|
        rental.display = false
        rental.save
        ActionCable.server.broadcast("rental_#{rental.id}", { image: @rental.media.photos.first.url })
      end
      @rental.display = true
    end
    @rental.save
    redirect_to rentals_path
  end

  def display
    @rental = Rental.where(display: true).first
    authorize @rental
  end

  def broadcast_rental
    ActionCable.server.broadcast("rental", {
      message_partial: ApplicationController.renderer.render(
        partial: "rentals/display",
        locals: { rental: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end

  private

  def params_rental
    params.require(:rental).permit(:media_id, :user_id)
  end
end
