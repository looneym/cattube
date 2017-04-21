module CategoriesHelper

  def get_subscriptions_from_ids
    Subscription.where(channel_id: @category.channel_ids)
  end

end
