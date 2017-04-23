class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @category_videos = @category.get_recent_videos
    @category_video_ids = Array.new
    @category_videos.each do |v|
      @category_video_ids.push(v.id)
    end
    @category_video_ids = @category_video_ids.to_json
  end

  def new
    @user_subscriptions = current_user.user_subscriptions
    @category = Category.new
  end

  def create
    # extract channel_ids and remove empty strings
    hash_params = category_params.to_h
    # ids =  hash_params[:channel_ids][:subscription_id]
    ids =  hash_params[:channel_ids][:ids]

    ids.each  {|id| ids.delete(id) if id.blank? }




    @category = Category.new()
    @category.name = hash_params[:name]
    @user = current_user
    @category.user = @user
    # @category.update_channel_ids(ids)
    @category.save!

    ids.each do |id|
      s = Subscription.new()
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
