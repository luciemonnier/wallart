class RentalChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rental_#{params[:rental_id]}"
  end
end
