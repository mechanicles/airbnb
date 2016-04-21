class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owned_spaces, class_name: 'Space', foreign_key: :user_id
  has_many :shared_office_spaces


  def profile_completed?
    email.present? && description.present? && phone_number.present? &&
      address.present? && company_name.present?
  end

end
