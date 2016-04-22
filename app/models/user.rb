class User < ActiveRecord::Base

  has_secure_password

  belongs_to :service
  belongs_to :size
  has_many :orders
  has_many :comments
end