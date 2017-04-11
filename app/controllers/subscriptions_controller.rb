class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.subscriptions
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    puts "saving subscriptn"
    @user = User.find(1)
    @subscription.user = @user

    @subscription.save
    redirect_to @subscription
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    redirect_to subscriptions_path
  end

  private
    def subscription_params
      params.require(:subscription).permit(
        :title,
        :description)
    end

end
