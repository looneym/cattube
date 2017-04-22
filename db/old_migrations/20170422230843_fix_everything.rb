class FixEverything < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :channel_ids

    # create_table :category_subscriptions do |t|
    #   t.timestamps
    # end
    #
    # add_column :category_subscriptions, :category_id, :string
    # add_column :category_subscriptions, :subscription_id, :string

  end
end
