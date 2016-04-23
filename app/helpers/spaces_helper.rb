module SpacesHelper

  def amenities
    Space::AMENITIES.map { |amenity| [amenity, amenity] }
  end

  def seating_period
    Space::SEATING_PERIOD.map { |period| [period, period] }
  end

end
