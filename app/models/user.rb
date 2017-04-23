class User < ActiveRecord::Base
  has_many :user_subscriptions
  has_many :category_subscriptions
  has_many :categories

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def sync_user_subscriptions
    subscriptions = YTClient::getUserSubscriptions(self)
    ActiveRecord::Base.transaction do
      self.user_subscriptions.clear
      subscriptions.each do |c|
        user_subscripton = UserSubscription.new(
          user: self,
          channel_id: c.id,
          title: c.title,
          description: c.description,
          image_url: c.snippet.thumbnails['default']['url'],
          video_count: c.statistics_set.video_count)
        user_subscripton.save!
      end
    end
  end

end
