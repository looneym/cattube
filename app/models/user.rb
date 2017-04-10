require 'json'

class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :categories

  def self.from_omniauth(auth)
    puts auth.to_json
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

  def sync_subscriptions
    access_token = self.oauth_token
    account = Yt::Account.new access_token: access_token
    account.subscribed_channels.each do |c|
      s = Subscription.new(
        user: self,
        channel_id: c.id,
        title: c.title,
        description: c.description,
        image_url: c.snippet.thumbnails['default']['url'])
      s.save
    end
  end


end
