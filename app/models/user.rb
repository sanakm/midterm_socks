class User < ActiveRecord::Base
  belongs_to :service
  belongs_to :size
  has_many :orders
  has_many :comments
end