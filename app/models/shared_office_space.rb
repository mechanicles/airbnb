class SharedOfficeSpace < ActiveRecord::Base
  belongs_to :user
  belongs_to :space

  validates :user, :space, presence: true
end
