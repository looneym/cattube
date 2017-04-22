class AddChannelIdsToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :channel_ids, :string, array: true, default: '{}'
  end
end
