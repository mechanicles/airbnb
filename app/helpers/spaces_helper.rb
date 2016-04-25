module SpacesHelper

  def amenities
    Space::AMENITIES.map { |amenity| [amenity, amenity] }
  end

end
