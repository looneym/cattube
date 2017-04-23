module CategoriesHelper

  # def get_subscriptions_from_ids
  #   Subscription.where(channel_id: @category.channel_ids, user: current_user)
  # end

  def get_channel_description_string
    category_subscriptions = @category.get_subscriptions
    if category_subscriptions.count == 1
      str = "Featuring videos from " + category_subscriptions.first.title
    elsif category_subscriptions.count == 2
      str = "Featuring videos from " + category_subscriptions.first.title + " and "  + category_subscriptions.second.title
    elsif category_subscriptions.count == 3
      str = "Featuring videos from " + category_subscriptions.first.title + ", " +
              category_subscriptions.second.title  + " and " + category_subscriptions.third.title
    elsif category_subscriptions.count > 3
      str = "Featuring videos from " + category_subscriptions.first.title + ", " +
              category_subscriptions.second.title  + " and "  + (category_subscriptions.count - 2).to_s + " more"
    end
    return str
  end

end
