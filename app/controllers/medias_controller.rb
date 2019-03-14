class MediasController < ApplicationController
  def index
    @categories = Category.all
    if params[:query].present?
      @medias_all = policy_scope(Media).search_by_title_category_and_description(params[:query])
      @medias_all = @medias.to_a
      scope(Media).each do |media|
        if media.tags.any? { |tag| tag.name.match(/#{params[:query].downcase}/) }
          @medias_all << media
        end
      end
    else
      @medias_all = policy_scope(Media)
    end
    @medias = @medias_all.select { |media| media.subscription_type.level <= current_user.subscription_type.level }
    @medias_unavailable = @medias_all.select { |media| media.subscription_type.level == current_user.subscription_type.level + 1 }
    @next_subscription = next_subscription(current_user.subscription_type)
  end

  def show
    @media = Media.find(params[:id])
    authorize @media
    @rental = Rental.new(media: @media, user: current_user)
  end

  private

  def next_subscription(subscription_type)
    if subscription_type.type < 2
      SubscriptionType.where(level: subscription_type.level + 1).first.name
    else
      subscription_type.name
    end
  end
end
