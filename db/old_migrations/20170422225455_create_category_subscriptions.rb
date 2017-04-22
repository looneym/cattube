class CreateCategorySubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :category_subscriptions do |t|

      t.timestamps
    end
  end
end
