class RentalsController < ApplicationController
  def index
    @images = ['rental1.jpg', 'rental2.jpg', 'rental3.jpg', 'rental4.jpg', 'rental5.jpg', 'rental6.jpg', 'rental7.jpg', ]
    @rentals = Rental.all
  end
end
