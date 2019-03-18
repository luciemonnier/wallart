class OrdersController < ApplicationController
  def create
  subscription_type = SubscriptionType.find(params[:subscription_type_id])
  order = Order.create!(subscription_type_name: subscription_type.name, amount_cents: subscription_type.price * 100, state: 'pending', user: current_user)
  authorize order
  redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
    authorize @order
  end
end
