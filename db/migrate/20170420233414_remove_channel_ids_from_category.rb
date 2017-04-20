class RemoveChannelIdsFromCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :channel_ids
  end
end
