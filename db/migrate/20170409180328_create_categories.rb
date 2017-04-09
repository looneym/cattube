class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :channel_ids, array: true, default: []

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
