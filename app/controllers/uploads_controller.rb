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
    ActionCable.server.broadcast("user_#{current_user.id}", {
      media_partial: ApplicationController.renderer.render(
        partial: "shared/media",
        locals: { url: 'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1553093701/mznyifv2lxjyub3ja7hy.jpg', category: "Upload", rental: false}
        )
      })
  end

  def index
    @uploads = policy_scope(Upload)
  end

  def update
    @upload = Upload.find(params[:id])
    authorize @upload
    Rental.where(user: current_user, display: true).each do |rental|
      rental.display = false
      rental.save
    end
    Upload.where(user: current_user, display: true).each do |upload|
      upload.display = false
    end
    @upload.display = true
    @upload.save
    ActionCable.server.broadcast("user_#{current_user.id}", {
      media_partial: ApplicationController.renderer.render(
        partial: "shared/media",
        locals: {url: @upload.photo, category: "Upload", rental: false}
      )
    })
    redirect_to rentals_path
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :description, :photo)
  end
end
