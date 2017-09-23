class Booking < ActiveRecord::Base
  has_many :users
  belongs_to :freetime
end
