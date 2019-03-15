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
    @rental.active = false
    @rental.save
    redirect_to rentals_path
  end

  private

  def params_rental
    params.require(:rental).permit(:media_id, :user_id)
  end
end
