class Category < ApplicationRecord
  belongs_to :user
  has_many :category_subscriptions


 # ActiveRecord will refuse to presist changes to arrays unless
 # this will_change! method is used
  def update_channel_ids(channel_ids)
    self.channel_ids_will_change!
    self.channel_ids = channel_ids
  end

 # Retrieves the 5 most recent videos from each channel
  def get_recent_videos
    # Array to hold all videos for the category
    category_videos = Array.new
    self.channel_ids.each do |id|
      # Array to hold target videos for the channel
      channel_videos = YTClient.getChannelVideos(id)
      # Push each chanel video into the category videos array
      channel_videos.each { |video| category_videos << video }
    end
    category_videos.sort! { |a,b| b.snippet.published_at <=> a.snippet.published_at }
    return category_videos
  end

end
