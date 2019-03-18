class SubscriptionTypesController < ApplicationController
  def show
    @subscription_type = SubscriptionType.find(params[:id])
    authorize @subscription_type
    @subscription_medias = Media.where(subscription_type: @subscription_type)
  end

  def index
    @subscription_types = policy_scope(SubscriptionType)
  end
end
