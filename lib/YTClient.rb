module YTClient
  require 'yt'

    # TODO: Use an environment variable here instead
    def self.getChannelVideos(id)
      Yt.configuration.api_key = "AIzaSyCUDS_fklJJz1h5CbNEIwkKk-fACM4v6ac"
      channel = Yt::Channel.new id: id
      channel.videos.take(5)
    end

    def self.getUserSubscriptions(user)
      account = Yt::Account.new access_token: user.oauth_token
      account.subscribed_channels
    end

    def self.getVideo(id)
      Yt.configuration.api_key = "AIzaSyCUDS_fklJJz1h5CbNEIwkKk-fACM4v6ac"
      video = Yt::Video.new id: id
      return video.snippet
    end

end
