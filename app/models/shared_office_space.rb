class SharedOfficeSpace < ActiveRecord::Base
  belongs_to :user
  belongs_to :space

  validates :user, :space, presence: true
  validates_uniqueness_of :space_id, scope: [:user_id], message: "has been taken by this user"
  validate :check_availability_of_seats
  validate :book_period

  SEATING_PERIOD = ['day', 'week', 'month']

  private

  def check_availability_of_seats
    if space.total_seats_booked?
      errrs.add(:base, "Total seats are booked for space #{space.name}")
    end
  end

  def book_period
    if period_start_date.nil?
      errors.add(:period_start_date, "should not be blank")
    elsif period_end_date.present? &&  period_start_date > period_end_date
      errors.add(:period_start_date, "should be less than Period end date")
    end
  end

end
