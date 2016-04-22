class Space < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :shared_office_spaces
  has_many :shared_users, through: :shared_office_spaces, source: :user

  validates :owner, :name, :address, presence: true

  AMENITIES = ['Internet', 'Canteen', 'Power Backup', '4 wheeler parking']
end
