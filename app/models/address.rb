class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :city, presence: true # currently kept it on 'city' only. Just for simplycity

  def to_s
    [street1, street2, city, state, country].compact.join(', ')
  end
end

