class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :addresses, dependent: :destroy

  scope :other, -> (id) { where("id = ?", id)}
end
