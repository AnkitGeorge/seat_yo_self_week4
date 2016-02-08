class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  # validates :capacity_validation


  def capacity_validation
    if party_size > restaurant.capacity
      errors.add(:party_size, "too large")
    end
  end

end
