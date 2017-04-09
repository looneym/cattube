# commands to generate models
bin/rails generate model User name:string email:string access_token:string refresh_token:string
bin/rails generate model Subscription channel_id:string image_url:string title:string description:string  user:references
bin/rails generate model Category name:string user:references

# manually edit the migration to support Arrays
# via http://stackoverflow.com/questions/11254467/rails-3-undefined-method-array-when-i-try-to-rake-dbmigrate
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

# run migrations with
rails db:migrate
