module YTClient
  require 'yt'

    API_KEY = ENV["YT_API_KEY"]

    def self.getChannelVideos(id)
      Yt.configuration.api_key = API_KEY
      channel = Yt::Channel.new id: id
      channel.videos.take(5)
    end

    def self.getUserSubscriptions(user)
      account = Yt::Account.new access_token: user.oauth_token
      account.subscribed_channels
    end

    def self.getVideo(id)
      Yt.configuration.api_key = API_KEY
      video = Yt::Video.new id: id
      return video.snippet
    end

end
