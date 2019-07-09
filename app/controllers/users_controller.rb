class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @subscription_types = SubscriptionType.select { |subscription_type| subscription_type.level > current_user.subscription_type.level }
    # if @subscription_types != []
    #   @subscription_types = @subscription_types.order('level ASC')
    # end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(params_user)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def user_package
    @package = current_user.package
  end

  private

  def params_user
    params.require(:user).permit(:last_name, :email, :photo, :first_name, :subscription_type)
  end
end
