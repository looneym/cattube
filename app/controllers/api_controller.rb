class ApiController < ApplicationController

  def show
    puts params[:id]
    puts "We did it reddit"
    msg = {:token => "123", :courseId => "456"}
    render :json => msg
  end
end
