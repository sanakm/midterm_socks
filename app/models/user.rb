class User < ActiveRecord::Base
  belongs_to :service
  belongs_to :size
  has_many :orders
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :password, presence: true, length: {minimum:6}
  validates :address, presence: true
  validates :city, presence: true
  validates :postalcode, presence: true

  validates :postalcode, format: { with: /^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$/,
    message: "is not a valid postal code"}

  validates :email, format: { with: /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$/, 
    message: "this is not a valid email address"}

  validates :phone, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/, 
    message: "this is not a valid phone number"}

  validates :name, format: { with: /^[\\p{L} .'-]+$}/,
    message: "this is not a name"}

  # use this if above format doesn't work: validates_format_of :postalcode, with: /^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$/, :message => "is not a valid postal code"
end
