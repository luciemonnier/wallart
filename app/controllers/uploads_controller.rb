class UploadsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @upload = Upload.new
    authorize @upload
    @upload.user = @user
  end

  def create
    @user = current_user
    @upload = Upload.new(upload_params)
    @upload.user = User.find(params[:user_id])
    authorize @upload
    if @upload.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    authorize @upload
    @upload.destroy
    redirect_to rentals_path
  end

  def index
    @uploads = policy_scope(Upload)
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :description, :photo)
  end
end
