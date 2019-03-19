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
    ActionCable.server.broadcast("user_#{current_user.id}", { image: @rental.media.photos.first.url })
    redirect_to rentals_path
  end

  def display
    if Rental.where(user: current_user, display: true).first == nil
      @rental = Rental.new
    else
      @rental = Rental.where(user: current_user, display: true).first
    end
    authorize @rental
    @upload = Upload.where(user: current_user, display: true).first
  end


  private

  def params_rental
    params.require(:rental).permit(:media_id, :user_id)
  end
end
