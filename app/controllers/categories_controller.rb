class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @recent_video_ids = @category.get_recent_videos.to_json
  end

  def new
    @user_subscriptions = current_user.user_subscriptions
    @category = Category.new
  end

  def create

    # TODO: should this be seperated out or put in the params method?
    # extract channel_ids and remove empty strings
    hash_params = category_params.to_h
    ids =  hash_params[:channel_ids][:ids]
    ids.each  {|id| ids.delete(id) if id.blank? }

    # TODO: this seems excessivly verbose, clean up?
    @category = Category.new()
    @category.name = hash_params[:name]
    @user = current_user
    @category.user = @user
    @category.save!

    # TODO: there should be a method to copy us -> s
    ids.each do |id|
      s = Subscription.new()
      us = UserSubscription.where(channel_id: id, user: current_user).first
      puts us
      puts us.title
      s.title = us.title
      s.description = us.description
      s.image_url = us.image_url
      s.video_count = us.video_count
      s.channel_id = id
      s.user_id = current_user.id
      s.save!
      cs = CategorySubscription.new
      cs.category = @category
      cs.subscription_id = s.id
      cs.save!
    end

    redirect_to @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category)
      .permit(:name, :channel_ids => [ :ids => []])
    end

end
