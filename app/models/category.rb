class Category < ApplicationRecord
  belongs_to :user
  has_many :category_subscriptions

  def get_subscriptions
    subscriptions =  Array.new
    cat_subs = CategorySubscription.where(category_id: self)
    cat_subs.each do |cs|
      subscriptions << Subscription.find(cs.subscription_id)
    end
    return subscriptions
  end

 # Retrieves the ids of the 5 most recent videos from each channel
  def get_recent_videos
    # Array to hold all videos for the category
    category_videos = Array.new
    cat_subs = CategorySubscription.where(category_id: self)
    cat_subs.each do |cs|
      # Array to hold target videos for the channel
      sub = Subscription.find(cs.subscription_id)
      channel_id = sub.channel_id
      channel_videos = YTClient.getChannelVideos(channel_id)
      # Push each chanel video into the category videos array
      channel_videos.each { |video| category_videos << video }
    end
    category_videos.sort! { |a,b| b.snippet.published_at <=> a.snippet.published_at }
    category_video_ids = Array.new
    category_videos.each do |v|
      category_video_ids.push(v.id)
    end
    return category_video_ids
  end

end
