class Subscription < ApplicationRecord

  def self.createFromUserSubscription us
    self.title = us.title
    self.description = us.description
    self.image_url = us.image_url
    self.video_count = us.video_count
    self.channel_id = us.channel_id
    self.user_id = current_user.id
  end

end
