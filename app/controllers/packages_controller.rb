class PackagesController < ApplicationController
  def index
    @user_package = current_user.package
    @all_packages = policy_scope(Package)
  end

  def show
    @package = Package.find(params[:id])
    authorize @package
    @package_medias = Media.select{|media| media.packages.include?(@package) }
  end
end
