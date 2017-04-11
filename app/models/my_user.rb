class User < ApplicationRecord
  has_many :subscriptions
  has_many :categories

end
