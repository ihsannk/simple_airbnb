class Property < ActiveRecord::Base
  # Remember to create a migration!
  has_many :propertytags
  has_many :tags, through: :propertytags
  has_many :bookings
  belongs_to :user

end
