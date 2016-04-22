class Size < ActiveRecord::Base

  has_many :users

  validates :size_desc, presence: true

end