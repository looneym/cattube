class Category < ApplicationRecord
  belongs_to :user

 # ActiveRecord will refuse to presist changes to arrays unless
 # this will_change! method is used
  def update_channel_ids(channel_ids)
    self.channel_ids_will_change!
    self.channel_ids = channel_ids
  end

end
