class RentalsController < ApplicationController
  def index
    @rentals = Rentals.all
  end
end
