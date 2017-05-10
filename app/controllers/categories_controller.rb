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
    @category = Category.new(
      name: params[:category][:name], 
      user: current_user )
    @category.save!
             
    ids = extract_ids
    ids.each do |id|
      # Create a new Subscription from the UserSubscription 
      us = UserSubscription.where(channel_id: id, user: current_user).first
      s = Subscription.new()
      s.createFromUserSubscription(us)
      s.save!
      # relationship entity to link Category and Subscription entities
      cs = CategorySubscription.new(
        category: @category,
        subscription_id: s.id)
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

    def extract_ids
      hash_params = category_params.to_h
      ids =  hash_params[:channel_ids][:ids]
      ids.each  {|id| ids.delete(id) if id.blank? }
      return ids
    end

end
