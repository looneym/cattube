class AddFiledsToUserSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_subscriptions, :subscription_id, :string
    add_column :user_subscriptions, :channel_id, :string
    add_column :user_subscriptions, :image_url, :string
    add_column :user_subscriptions, :title, :string
    add_column :user_subscriptions, :description, :string
    add_column :user_subscriptions, :user_id, :integer
    add_column :user_subscriptions, :video_count, :integer
  end
end
