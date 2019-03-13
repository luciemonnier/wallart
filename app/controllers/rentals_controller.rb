class RentalsController < ApplicationController
  def index
    @images = ['rental1.jpg', 'rental2.jpg', 'rental3.jpg', 'rental4.jpg', 'rental5.jpg', 'rental6.jpg', 'rental7.jpg', ]
    @rentals = Rental.all
  end

  def create
    @rental = Rental.new(params_rental)
    if @rental.save
      redirect_to rentals_path
    end
  end

  private

  def params_rental
    params.require(:rental).permit(:media_id, :user_id)
  end
end
