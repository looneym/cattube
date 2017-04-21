module CategoriesHelper

  def get_subscriptions_from_ids
    subscriptions = Subscription.where(channel_id: @category.channel_ids)
  end

end
