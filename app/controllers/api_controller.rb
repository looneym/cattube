class ApiController < ApplicationController

  def show
    puts params[:id]
    puts "We did it reddit"
  end
end
