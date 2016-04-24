class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :owned_spaces, class_name: 'Space', foreign_key: :user_id
  has_many :shared_office_spaces
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address

  ROLES = { admin: 'admin' }

  def admin?
    role == ROLES[:admin]
  end

  def store_omniauth_credentials(auth)
    update(provider: auth.provider, uid: auth.uid)
  end

  def connected_to?(_provider)
    provider == _provider && uid.present?
  end

  def profile_completed?
    email.present? && description.present? && phone_number.present? &&
      address.present? && company_name.present? && connected_to?('facebook')
  end

  def booked?(space)
    shared_office_spaces.where(space_id: space.id).any?
  end

end
