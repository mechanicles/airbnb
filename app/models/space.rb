class Space < ActiveRecord::Base
  mount_uploaders :pictures, PictureUploader

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_one :address, as: :addressable
  has_many :shared_office_spaces
  has_many :shared_users, through: :shared_office_spaces, source: :user

  validates :owner, :name, :total_seats, presence: true
  validate :start_time_and_end_time

  scope :featured, -> { where(featured: true ) }

  accepts_nested_attributes_for :address

  AMENITIES = ['Internet', 'Canteen', 'Power Backup', '4 wheeler parking']
  SEATING_PERIOD = ['day', 'week', 'month']

  def total_seats_booked?
    shared_office_spaces.count == total_seats
  end

  def thumbnail_picture
    return "" if pictures.blank?

    pictures.last.thumb.url
  end

  private

  def start_time_and_end_time
    if start_time.nil? || end_time.nil?
      errors.add(:base, "Start time and End time should not be blank")
    elsif start_time > end_time
      errors.add(:start_time, "should be less than End time")
    end
  end

end
