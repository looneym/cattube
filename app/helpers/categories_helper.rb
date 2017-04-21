module CategoriesHelper

  def get_subscriptions_from_ids
    Subscription.where(channel_id: @category.channel_ids, user: current_user)
  end

  def get_channel_description_string
    channel_subscriptions = get_subscriptions_from_ids
    if channel_subscriptions.count == 1
      str = "Featuring videos from " + channel_subscriptions.first.title
    elsif channel_subscriptions.count == 2
      str = "Featuring videos from " + channel_subscriptions.first.title + " and "  + channel_subscriptions.second.title
    elsif channel_subscriptions.count == 3
      str = "Featuring videos from " + channel_subscriptions.first.title + ", " +
              channel_subscriptions.second.title  + " and " + channel_subscriptions.third.title
    elsif channel_subscriptions.count > 3
      str = "Featuring videos from " + channel_subscriptions.first.title + ", " +
              channel_subscriptions.second.title  + " and "  + channel_subscriptions.count - 2 + " more"
    end
    return str
  end

end
