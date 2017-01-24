class Address < ApplicationRecord
  belongs_to :user

  # Validations are mainly present so views can't be broken with some extreme values
  # Addresses are for the use of User himself so no point of stopping him trying to enter 'batman' as phone number
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :name, :zip_code, :country, :state, :phone, :mobile, :email, :website, length: { maximum: 50 }
  validates :address1, :address2, length: { maximum: 200 }
  validates :other, length: { maximum: 2000 }
end
