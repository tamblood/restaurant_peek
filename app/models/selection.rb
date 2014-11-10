class Selection < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  # Remember to create a migration!
end
