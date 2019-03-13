class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def params_user
    params.require(:user).permit(:last_name, :email, :photo, :first_name)
  end
end
