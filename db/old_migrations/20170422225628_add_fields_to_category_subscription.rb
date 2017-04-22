class AddFieldsToCategorySubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :category_subscriptions, :category_id, :string
    add_column :category_subscriptions, :subscription_id, :string
  end
end
