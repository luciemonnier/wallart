class PaymentsController < ApplicationController
  before_action :set_order

  def new
    authorize @order
  end

  def create
  authorize @order
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents * 100,
    description:  "Payment for subscription #{@subscription_type_name} for order #{@order.id}",
    currency:     @order.amount_currency
  )

  @order.update(payment: charge.to_json, state: 'paid')
  redirect_to order_path(@order)
  @user = current_user
  @user.update(subscription_type: SubscriptionType.find_by(name: @order.subscription_type_name))
  end

private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
