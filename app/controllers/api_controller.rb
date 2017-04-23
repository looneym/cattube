class ApiController < ApplicationController

  def show
    video_id = params[:id]
    video = YTClient.getVideo(video_id)
    render :json => video
  end
end
