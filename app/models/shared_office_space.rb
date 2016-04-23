class SharedOfficeSpace < ActiveRecord::Base
  belongs_to :user
  belongs_to :space

  validates :user, :space, presence: true
  validates_uniqueness_of :space_id, scope: [:user_id], message: "has been taken by this user"
  validate :check_availability_of_seats

  private

  def check_availability_of_seats
    if space.total_seats_booked?
      errrs.add(:base, "Total seats are booked for space #{space.name}")
    end
  end

end
