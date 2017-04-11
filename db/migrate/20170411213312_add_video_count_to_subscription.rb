class AddVideoCountToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :video_count, :integer
  end
end
